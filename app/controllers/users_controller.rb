class UsersController < ApplicationController
  layout 'users'

  include SolrHelper
  include BHL::Login
  include BooksHelper
  # GET /users/new
  def new
    return redirect_to :controller => :users, :action => :show, :id => session[:user_id] if is_loggged_in?
    @page_title = I18n.t(:sign_up)
    @user = User.new
    @verify_captcha = true
  end

  # POST /users
  def create
    return redirect_to :controller => :users, :action => :show, :id => session[:user_id] if is_loggged_in?
    @user = User.new(params[:user])
    if @user.valid? && verify_recaptcha
      @user.save
      url = "#{request.host}:#{request.port}/users/activate/#{@user.guid}/#{@user.verification_code}"
      Notifier.user_verification(@user, url)
      log_in(@user)
      flash.now[:notice] = I18n.t(:registration_welcome_message, :real_name => @user.real_name)
      flash.keep
      redirect_to :controller => :users, :action => :show, :id => @user.id
    else
      @verify_captcha = true
      @page_title = I18n.t(:sign_up)
      @user.errors.add('recaptcha', I18n.t("form_validation_errors_for_attribute_assistive")) unless verify_recaptcha
      render :action => :new
    end
  end

  # GET /users/forget_password
  def forgot_password
    return redirect_to :controller => :users, :action => :show, :id => session[:user_id] if is_loggged_in?
    @page_title = I18n.t(:forgot_password_title)
  end

  # GET /users/activate/:guid/:activation_code
  def activate
    @user = User.find_by_guid_and_verification_code(params[:guid], params[:activation_code])
    if @user.nil?
      flash[:error] = I18n.t(:activation_failed)
      flash.keep
      return redirect_to root_path
    end
    if @user.active
      flash[:error] = I18n.t(:account_already_active)
      flash.keep
      redirect_to root_path
    else
      @user.activate
      flash.now[:notice] = I18n.t(:account_activated, :real_name => @user.real_name)
      flash.keep
      Notifier.user_activated(@user)
      if is_loggged_in?
        log_out
        log_in(@user) # to make sure everything is loaded properly
      end
      redirect_to root_path
    end
  end

  # GET /users/:id
  def show
    @id = params[:id]
    @id = session[:user_id] if @id.nil?
    return redirect_to root_path if @id.nil?
    @user = User.find_by_id(@id)
    return redirect_to root_path if @user.nil?
    current_user = false
    current_user = true if session["user_id"].to_i == params[:id].to_i

    @can_edit = @id.to_i == session[:user_id]

    if current_user
      @tabs = {:profile => I18n.t(:user_profile), :annotations => I18n.t(:annotations), :saved_queries => I18n.t(:saved_queries), :recently_viewed => I18n.t(:recently_viewed), :collections => I18n.t(:collections)}
    else
      @tabs = {:profile => I18n.t(:user_profile), :collections => I18n.t(:collections)}
    end
    @current = params[:tab] != nil ? params[:tab] : "profile"

    @page_title = @user.real_name
    @ubh = UserBookHistory.where(:user_id => @user)
       
   if @ubh.length > 0
     @recently_viewed_volume = Volume.find_by_id((@ubh.first).volume)
   end
   
    if @current == "recently_viewed"
      if authenticate_user
        #load history from DB
        @total_number = @ubh.count
        @view = params[:view] ? params[:view] : 'list'
        @page = params[:page] ? params[:page].to_i : 1
        @lastPage = @ubh.count ? ((@ubh.count).to_f/PAGE_SIZE).ceil : 0
        limit = PAGE_SIZE
        offset = (@page > 1) ? (@page - 1) * limit : 0
        @ubh = UserBookHistory.limit(limit).offset(offset).where(:user_id => @user)
        if @ubh.count == 0 and @page > 1
          redirect_to :controller => :users, :action => :show, :id => session[:user_id], :tab => "recently_viewed", :page => params[:page].to_i - 1
        end
        @url_params = params.clone
      end
    elsif @current == "saved_queries"
      if authenticate_user
        # load user saved queries
        @queries = @user.queries.order('created_at DESC')
        @queries_total_number = @queries.count
        @page = params[:page] ? params[:page].to_i : 1
        @lastPage = @queries.count ? ((@queries.count).to_f/PAGE_SIZE).ceil : 0
        limit = PAGE_SIZE
        offset = (@page > 1) ? (@page - 1) * limit : 0
        @queries = @queries.limit(limit).offset(offset)
        @url_params = params.clone
      end
      # end
    end

    if @current == "collections"
      if current_user
        @user_collections = Collection.where("user_id = #{@user.id}")
      else
        @user_collections = Collection.where("user_id = #{@user.id} and status = true")
      end
      @user_collections_total_number = @user_collections.count
      @page = params[:page] ? params[:page].to_i : 1
      @lastPage = @user_collections.count ? ((@user_collections.count).to_f/PAGE_SIZE).ceil : 0
      limit = PAGE_SIZE
      offset = (@page > 1) ? (@page - 1) * limit : 0
      @user_collections = @user_collections.limit(limit).offset(offset)
      @url_params = params.clone
    end
  end

  # POST /users/recover_password
  def recover_password
    return redirect_to :controller => :users, :action => :show, :id => session[:user_id] if is_loggged_in?

    @email = params[:user][:email]
    return redirect_to users_forgot_password_path unless @email
    @user = User.find_by_email(@email)

    if @user.nil?
      flash.now[:error] = I18n.t(:user_not_found_by_email_address, :email => @email)
      flash.keep
      redirect_to users_forgot_password_path
    else
      # I am changing activation code, then send an email with a link to reset password
      @user.change_activation_code
      reset_password_url = "#{request.host}:#{request.port}/users/reset_passwpord/#{@user.guid}/#{@user.verification_code}"
      Notifier.user_reset_password_verification(@user, reset_password_url)
      flash.now[:notice] = I18n.t(:recover_password_success)
      flash.keep
      redirect_to :controller => :users, :action => :login
    end
  end

  # GET /users/reset_password/:guid/:activation_code
  def reset_password
    return redirect_to :controller => :users, :action => :show, :id => session[:user_id] if is_loggged_in?
    @user = User.find_by_guid_and_verification_code(params[:guid], params[:activation_code])
    if @user.nil?
      flash[:error] = I18n.t(:reset_password_failed)
      flash.keep
      return redirect_to root_path
    end

    @page_title = I18n.t(:reset_password)
  end

  #POST /users/reset_password_action
  def reset_password_action
    # I need to double check
    return redirect_to :controller => :users, :action => :show, :id => session[:user_id] if is_loggged_in?
    @user = User.find_by_guid_and_verification_code(params[:user][:guid], params[:user][:activation_code])
    if @user.nil?
      flash[:error] = I18n.t(:reset_password_failed)
      flash.keep
      return redirect_to root_path
    end

    @user.entered_password = params[:user][:entered_password]
    @user.entered_password_confirmation = params[:user][:entered_password_confirmation]

    if @user.valid? && @user.save
      flash[:notice] = I18n.t(:reset_password_success)
      flash.keep
      redirect_to :controller => :users, :action => :login
    else
      flash[:error] = @user.errors.full_messages.join("<br>")
      flash.keep
      return redirect_to "/users/reset_password/#{params[:user][:guid]}/#{params[:user][:activation_code]}"
    end
  end

  # GET /users/logout
  def logout
    log_out
    redirect_to root_path
  end

  # GET /users/login
  def login
    return redirect_to :controller => :users, :action => :show, :id => session[:user_id] if is_loggged_in?
    @page_title = I18n.t(:sign_in)
  end

  # POST /users/validate
  def validate
    return redirect_to :controller => :users, :action => :show, :id => session[:user_id] if is_loggged_in?
    username = params[:user][:username]
    password = params[:user][:password]
    @user = User.authenticate(username, password)

    if @user.nil?
      flash.now[:error] = I18n.t(:sign_in_unsuccessful_error)
      flash.keep
      redirect_to :controller => :users, :action => :login
    else
      log_in(@user)
      flash.now[:notice] = I18n.t(:sign_in_successful_notice)
      flash.keep
      if params[:return_to].blank?
        redirect_to :controller => :users, :action => :show, :id => @user.id
      else
        redirect_to params[:return_to]
      end
    end
  end

  # GET /users/:id/edit
  def edit
    if authenticate_user
      @page_title = I18n.t(:modify_profile)
      @verify_captcha = false
      @user = User.find_by_id(params[:id])
      @user.email_confirmation = @user.email
    end
  end

  #PUT /users
  def update
    if authenticate_user
      @user = User.find(params[:id])
      #    if params[:user][:entered_password].blank? && params[:user][:entered_password_confirmation].blank?
      #      params[:user][:entered_password] = nil
      #      params[:user][:entered_password_confirmation] = nil
      #    end
      if @user.update_attributes(params[:user])
        log_out
        log_in(@user) # to make sure everything is loaded properly
        flash.now[:notice] = I18n.t("changes_saved")
        flash.keep
        return redirect_to :controller => :users, :action => :show, :id => params[:id]
      else
        flash.keep
        render :action => :edit
      end
    end
  end

  def remove_book_history
    if authenticate_user
      voulume_id = params[:volume_id]
      user_id = session["user_id"]
      UserBookHistory.where(:volume_id => voulume_id, :user_id => user_id)[0].delete
      flash.now[:notice]=I18n.t(:book_removed)
      flash.keep
      redirect_to :controller => :users, :action => :show, :id => user_id, :tab => "recently_viewed", :page => params[:page]
    end
  end

  private

  def authenticate_user
    if !is_loggged_in?
      redirect_to :controller => :users, :action => :login
      return false
    end
    if session["user_id"].to_i != params[:id].to_i
      flash.now[:error] = I18n.t(:access_denied_error)
      flash.keep
      redirect_to :controller => :users, :action => :show, :id => params[:id]
      return false
    end
    return true
  end
end

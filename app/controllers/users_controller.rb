class UsersController < ApplicationController
  layout 'users'
  require 'will_paginate/array'

  include SolrHelper
  include BHL::Login
  include BooksHelper
  include ApplicationHelper
  include ActivitiesHelper
  
  before_filter :authenticate_user, only: [:edit, :update]
  before_filter :redirect_if_already_logged_in, only: [:validate, :login, :recover_password, :forgot_password,
                                                       :reset_password_action, :reset_password, :create, :new]
  
  # GET /users/new
  def new
    if session[:failed_user]
      @user = User.new(session[:failed_user])
      @user.valid?
      session[:failed_user] = nil
    else
       @user = User.new
    end
  end

  # POST /users
  def create
    @user = User.new(params[:user])

    if @user.valid? && verify_recaptcha
      handle_successful_registration
    else
      handle_failed_registration
    end
  end

  # GET /users/forget_password
  def forgot_password
    
  end

  # GET /users/activate/:guid/:activation_code
  def activate
    @user = User.find_by_guid_and_verification_code(params[:guid], params[:activation_code])
    return redirect_to root_path, flash: { error: I18n.t(:activation_failed) } if @user.nil?
    if @user.active
      redirect_to root_path, flash: { error: I18n.t(:account_already_active) }
    else
      activate_user
    end
  end

  # GET /users/:id
  def show
    load_user
    if @tab == "history"
      load_history_tab
    elsif @tab == "annotations"
      load_annotations_tab
    elsif @tab == "queries"
     load_queries_tab
    elsif @tab == "activity"
      load_activities_tab
    elsif @tab == "collections"
      load_collections_tab
    end
  end

  # POST /users/recover_password
  def recover_password
    if verify_recaptcha
      @email = params[:user][:email]
      return redirect_to users_forgot_password_path, flash: { error: I18n.t(:invalid_email_address) } if @email.blank?
      @user = User.find_by_email(@email)
      return redirect_to users_forgot_password_path, flash: { error: I18n.t(:user_not_found_by_email_address, :email => @email) } if @user.nil?
          # I am changing activation code, then send an email with a link to reset password
      @user.change_activation_code          
      redirect_to({ controller: 'users', action: 'login' }, flash: send_recover_password_email)
    else
      redirect_to users_forgot_password_path, flash: { error: I18n.t(:form_validation_errors_for_attribute_assistive) }
    end
  end

  # GET /users/reset_password/:guid/:activation_code
  def reset_password
    @user = User.find_by_guid_and_verification_code(params[:guid], params[:activation_code])    
    return redirect_to root_path, flash: { error: I18n.t(:reset_password_failed) } if @user.nil?
  end

  #POST /users/reset_password_action
  def reset_password_action
    # I need to double check    
    @user = User.find_by_guid_and_verification_code(params[:user][:guid], params[:user][:activation_code])
    return redirect_to root_path, flash: { error: I18n.t(:reset_password_failed) } if @user.nil?

    @user.entered_password = params[:user][:entered_password]
    @user.entered_password_confirmation = params[:user][:entered_password_confirmation]

    if @user.valid? && @user.save
      redirect_to({ controller: 'users', action: 'login' }, flash: { notice: I18n.t(:reset_password_success) })
    else
      return redirect_to "/users/reset_password/#{params[:user][:guid]}/#{params[:user][:activation_code]}", flash: { error: @user.errors.full_messages.join("<br>") }
    end
  end

  # GET /users/logout
  def logout
    log_out
    redirect_to root_path
  end

  # GET /users/login
  def login
    session[:login_attempts] ||= 0
    @verify_captcha = true if (session[:login_attempts].to_i  >= LOGIN_ATTEMPTS)
  end

  # POST /users/validate
  def validate
    if (session[:login_attempts].to_i >= LOGIN_ATTEMPTS) && !(verify_recaptcha)
      redirect_to controller: 'users', action: 'login', flash: { error: I18n.t(:captcha_error) }
    else
      @user = User.authenticate(params[:user][:username], params[:user][:password])
      if @user.nil?
        failed_validation
      else
       successful_validation
      end
    end
  end

  # GET /users/:id/edit
  def edit
    @user = User.find_by_id(params[:id])
    @user.email_confirmation = @user.email
  end

  #PUT /users
  def update
    @user = User.find(params[:id])
    @user_attr = params[:user]
    set_user_photo_name
    valid_old_password = is_old_password_correct?
    if valid_old_password && @user.update_attributes(@user_attr)
      handle_successful_update
    else
      handle_failed_update(valid_old_password)
    end
  end  

  def get_user_profile_photo
     @user = User.find(params[:id])
     if (params[:id].to_i == session[:user_id] && params[:is_delete].to_i == 1)
       @user[:photo_name] = ''
       @user.save
      delete_user_photo(params[:id])
     end
    respond_to do |format|
      format.html {render :partial => "users/get_user_profile_photo"}
    end
  end

  def rate
    if is_loggged_in? && params[:rate] != "NaN"
      volume = Volume.find_by_job_id(params[:job_id])
      volume_rate_list = VolumeRating.where(:user_id => params[:user_id], :volume_id => volume.id)
      if volume_rate_list.count > 0 && params[:rate].to_f < 1
        volume_rate_list[0].delete
      else
        #create new or updat existing
        if volume_rate_list.count == 0
          #create
          volume_rate = VolumeRating.create!(:user_id => params[:user_id], :volume_id => volume.id, :rate => params[:rate])
        else
          #update
          volume_rate = volume_rate_list[0]
          volume_rate.rate = params[:rate]
        end
        volume_rate.save
      end
      #update volume global rate
      volume = volume.set_rate
      data = volume.rate
      #NEW_LAYOUT CODE TO ADD RATE TO SOLR
      update_solr_rate(volume)
      render :json => data
    else
      #go to sign in page
      render :js => "window.location = '/users/login'"
    end
  end

  def rate_collection
    if is_loggged_in? && params[:rate] != "NaN"
      collection = Collection.find_by_id(params[:col_id])
      col_rate_list = CollectionRating.where(:user_id => params[:user_id], :collection_id => collection.id)
      if col_rate_list.count > 0 && params[:rate].to_f < 1
        col_rate_list[0].delete
      else
        #create new or updat existing
        if col_rate_list.count == 0
          #create
          collection_rate = CollectionRating.create!(:user_id => params[:user_id], :collection_id => collection.id, :rate => params[:rate])
        else
          #update
          collection_rate = col_rate_list[0]
          collection_rate.rate = params[:rate]
        end
        collection_rate.save
      end
      #update volume global rate
      collection = collection.set_rate
      data = collection.rate
      render :json => data
    else
      #go to sign in page
      render :js => "window.location = '/users/login'"
    end
  end

  private

  def delete_user_photo(id)
    user = User.find(id)
    FileUtils.rm_rf "users/#{id}" if File.directory? "users/#{id}"
    user[:photo_name] = ''
    user.save
  end

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
  
  def handle_successful_registration
    @user.save
    send_registration_confirmation_email
    redirect_to root_path, flash: { notice: I18n.t(:registration_welcome_message, real_name: @user.real_name) }
  end
  
  def handle_failed_registration          
    @user.errors.add('recaptcha', I18n.t("form_validation_errors_for_attribute_assistive")) unless verify_recaptcha
    session[:failed_user] = params[:user]
    redirect_to controller: "users", action: "new"
  end
  
  def send_registration_confirmation_email
    url = "#{request.host}/users/activate/#{@user.guid}/#{@user.verification_code}"
    Notifier.user_verification(@user, url).deliver
  end
  
  def set_user_photo_name
    unless params[:test]
      if params[:user][:photo_name]
        image_ext = File.extname(@user_attr[:photo_name].original_filename)
        @user_attr[:photo_name].original_filename = "image_#{DateTime.now.to_s}#{image_ext}"
      end
    end
  end
  
  def is_old_password_correct?
    return false if(!@user_attr[:old_password].blank? && !(User.authenticate(@user_attr[:username],@user_attr[:old_password])))
    return true    
  end
  
  def handle_successful_update
    log_out
    log_in(@user) # to make sure everything is loaded properly
    return redirect_to({ controller: "users", action: "show", id: params[:id] }, flash: { notice: I18n.t("changes_saved") })
  end
  
  def handle_failed_update(valid_old_password)
    params[:entered_password] = nil
    params[:password_confirmation] = nil
    @user.email_confirmation = @user.email
    flash[:error] =  I18n.t(:invalid_old_password) unless valid_old_password
    render action: 'edit'
  end
  
  def failed_validation
    session[:login_attempts] = session[:login_attempts].to_i + 1
    return redirect_to({ controller: 'users', action: 'login' }, flash: { error: I18n.t(:sign_in_unsuccessful_error) })
  end
  
  def successful_validation
    log_in(@user)
    if params[:return_to].blank?
      return redirect_to({ controller: 'users', action: 'show', id: @user.id }, flash: { notice: I18n.t(:sign_in_successful_notice) })
    else
      return redirect_to params[:return_to], flash: { notice: I18n.t(:sign_in_successful_notice) }
    end
  end
  
  def activate_user
    @user.activate
    Notifier.user_activated(@user).deliver
    if is_loggged_in?
      log_out
      log_in(@user) # to make sure everything is loaded properly
    end
    redirect_to root_path, flash: { notice: I18n.t(:account_activated, real_name: @user.real_name) }
  end
  
  def send_recover_password_email
    reset_password_url = "#{request.host}/users/reset_password/#{@user.guid}/#{@user.verification_code}"
    begin
      Notifier.user_reset_password_verification(@user, reset_password_url).deliver
      { notice: I18n.t(:recover_password_success) }
    rescue Exception  => e
      { notice: "email sending failed #{e.message}" }
    end
  end
  
  def redirect_if_already_logged_in
    return redirect_to controller: 'users', action: 'show', id: session[:user_id] if is_loggged_in?
  end
  
  def load_user
    @user = User.find_by_id(params[:id])
    return redirect_to root_path unless @user
    @tab = params[:tab].nil? ? "profile" : params[:tab]
  end
  
  def load_history_tab
    if authenticate_user
      @page = params[:page] ? params[:page].to_i : 1
      
      @history = UserBookHistory.where(:user_id => @user).paginate(:page => @page, :per_page => TAB_PAGE_SIZE)
      
  
      if @history.length > 0
        @recently_viewed_volume = Volume.find_by_id((@history.first).volume)
      end
      
      if @history.blank? && @page > 1
        redirect_to :controller => :users, :action => :show, :id => session[:user_id], :tab => "history", :page => params[:page].to_i - 1
      end
      
      @url_params = params.clone
    end
  end
  
  def load_annotations_tab
    if authenticate_user
      # load user annotations
      @page = params[:page] ? params[:page].to_i : 1
      # offset = (@page > 1) ? (@page - 1) * TAB_GALLERY_PAGE_SIZE : 0
      @total_number = Annotation.count(:conditions => "user_id = #{@user.id}")
      # @lastPage = @total_number ? ((@total_number).to_f/TAB_GALLERY_PAGE_SIZE).ceil : 0
      
      # @annotation = Annotation.where(:user_id => @user).select(:volume_id).group(:volume_id).limit(TAB_GALLERY_PAGE_SIZE).offset(offset)
      @annotation = Annotation.where(:user_id => @user).select(:volume_id).group(:volume_id).paginate(:page => @page, :per_page => TAB_GALLERY_PAGE_SIZE)
      @url_params = params.clone
    end
      # end
  end
  
  def load_queries_tab
   if authenticate_user
      @page = params[:page] ? params[:page].to_i : 1
      @queries = @user.queries.paginate(:page => @page, :per_page => TAB_PAGE_SIZE).order('created_at DESC')
      if @queries.blank? &&  @page > 1
        redirect_to :controller => :users, :action => :show, :id => session[:user_id], :tab => "queries", :page => params[:page].to_i - 1
      end
      @url_params = params.clone
    end
  end
  
  def load_activities_tab
    collections_cond = "is_public = true AND user_id = #{@user.id}"
      collections_cond = "user_id = #{@user.id}" if @user.id == session[:user_id]
      @total_number = LogActivities.find_by_sql("SELECT SUM(result.count) AS count
                                              FROM((SELECT id, count(*) AS count
                                              FROM collections
                                              WHERE #{collections_cond})
                                              UNION
                                              (SELECT id, count(*) AS count
                                              FROM volume_ratings
                                              WHERE user_id = #{@user.id})
                                              UNION
                                              (SELECT id, count(*) AS count
                                              FROM collection_ratings
                                              WHERE user_id = #{@user.id})
                                              UNION
                                              (SELECT id, count(*) AS count
                                              FROM comments WHERE number_of_marks < #{MAX_NO_ABUSE}
                                              and user_id = #{@user.id})
                                              ) result")
      # applying pagination on log_records array
      @page = params[:page] ? params[:page].to_i : 1
      limit = TAB_PAGE_SIZE
      offset = (@page > 1) ? (@page - 1) * limit : 0
      # sql_stmt : to select current user activities including creating new collection,
      # rating book or collection
      # and also commented on book or collection ordered by creation time
      sql_stmt = "SELECT
                  result.table_type AS table_type,
                  result.id AS id,
                  result.time AS time
                  FROM((SELECT 'collection' AS table_type,
                  id AS id,
                  created_at AS time
                  FROM collections
                  WHERE #{collections_cond})
                  UNION
                  (SELECT
                  'volume_ratings' AS table_type,
                  id AS id,
                  created_at AS time
                  FROM volume_ratings
                  WHERE user_id = #{@user.id})
                  UNION
                  (SELECT
                  'collection_ratings' AS table_type,
                  id AS id,
                  created_at AS time
                  FROM collection_ratings
                  WHERE user_id = #{@user.id})
                  UNION
                  (SELECT
                  'comments' AS table_type,
                  id AS id,
                  created_at AS time
                  FROM comments WHERE number_of_marks < #{MAX_NO_ABUSE}
                  and user_id = #{@user.id})
                  ) result
                  ORDER BY time DESC LIMIT #{offset}, #{limit};"
    # call get_log_activity(sql_stmt) to ececute sql stmt and returns array of activity records
    result = get_log_activity(sql_stmt)
    @log_records= WillPaginate::Collection.create(@page, TAB_PAGE_SIZE, @total_number[0][:count].to_i) do |pager|
      pager.replace result
    end
      @url_params = params.clone
  end
  
  def load_collections_tab    
    @page = params[:page] ? params[:page].to_i : 1
      if @user.id.to_i == session[:user_id]
        @collections = @user.collections.paginate(:page => @page, :per_page => TAB_PAGE_SIZE)
      else
        @collections = @user.public_collections.paginate(:page => @page, :per_page => TAB_PAGE_SIZE)
      end
      if @collections.blank? &&  @page > 1
        redirect_to :controller => :users, :action => :show, :id => session[:user_id], :tab => "collections", :page => params[:page].to_i - 1
      end
      @url_params = params.clone
  end
end

class UsersController < ApplicationController
  layout 'users'

  include SolrHelper
  include BHL::Login
  include BooksHelper
  include ApplicationHelper
  include ActivitiesHelper
  # GET /users/new
  def new
    return redirect_to :controller => :users, :action => :show, :id => session[:user_id] if is_loggged_in?
    @page_title = I18n.t(:sign_up)
    @action = "signup"
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
      @action = "signup"
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

    @tab = params[:tab] != nil ? params[:tab] : "profile"

    @page_title = @user.real_name

    if @tab == "history"
      if authenticate_user
        @total_number = UserBookHistory.count(:conditions => "user_id = #{@user.id}")
        @page = params[:page] ? params[:page].to_i : 1
        @lastPage = @total_number ? ((@total_number).to_f/TAB_PAGE_SIZE).ceil : 0
        offset = (@page > 1) ? (@page - 1) * TAB_PAGE_SIZE : 0
        
        @history = UserBookHistory.where(:user_id => @user).limit(TAB_PAGE_SIZE).offset(offset)
        

        if @history.length > 0
          @recently_viewed_volume = Volume.find_by_id((@history.first).volume)
        end
        
        if @history.count == 0 and @page > 1
          redirect_to :controller => :users, :action => :show, :id => session[:user_id], :tab => "history", :page => params[:page].to_i - 1
        end
        
        @url_params = params.clone
      end
    elsif @tab == "annotations"
      if authenticate_user
        # load user annotations
        @page = params[:page] ? params[:page].to_i : 1
        offset = (@page > 1) ? (@page - 1) * TAB_GALLERY_PAGE_SIZE : 0
        @total_number = Annotation.count(:conditions => "user_id = #{@user.id}")
        @lastPage = @total_number ? ((@total_number).to_f/TAB_GALLERY_PAGE_SIZE).ceil : 0
        
        @annotation = Annotation.where(:user_id => @user).select(:volume_id).group(:volume_id).limit(TAB_GALLERY_PAGE_SIZE).offset(offset)
        @url_params = params.clone
      end
      # end
    elsif @tab == "queries"
      if authenticate_user
        # load user saved queries
        @total_number = @user.queries.count()
        @page = params[:page] ? params[:page].to_i : 1
        @lastPage = @total_number ? ((@total_number).to_f/TAB_PAGE_SIZE).ceil : 0
        offset = (@page > 1) ? (@page - 1) * TAB_PAGE_SIZE : 0
        @queries = @user.queries.order('created_at DESC').limit(TAB_PAGE_SIZE).offset(offset)
        @url_params = params.clone
      end
      # end

      elsif @tab == "activity"
            if authenticate_user
              @total_number = LogActivities.find_by_sql("SELECT SUM(result.count) AS count
                                                        FROM((SELECT count(*) AS count
                                                        FROM collections
                                                        WHERE user_id = 34)
                                                        UNION
                                                        (SELECT count(*) AS count
                                                        FROM volume_ratings
                                                        WHERE user_id = 34)
                                                        UNION
                                                        (SELECT count(*) AS count
                                                        FROM collection_ratings
                                                        WHERE user_id = 34)
                                                        UNION
                                                        (SELECT count(*) AS count
                                                        FROM comments WHERE number_of_marks IS NULL OR number_of_marks = 0
                                                        and user_id = 34)
                                                        ) result;")
              # applying pagination on log_records array
              @page = params[:page] ? params[:page].to_i : 1
              limit = TAB_PAGE_SIZE
              offset = (@page > 1) ? (@page - 1) * limit : 0
              @lastPage = @total_number[0][:count] ? ((@total_number[0][:count]).to_f/TAB_PAGE_SIZE).ceil : 0
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
      WHERE user_id = #{@user.id})
      UNION
      (SELECT
      'volume_ratings' AS table_type,
      id AS id,
      created_at AS time
      FROM volume_ratings
      WHERE user_id = #{@user.id})
      UNION
      (SELECT
      'volume_ratings' AS table_type,
      id AS id,
      created_at AS time
      FROM collection_ratings
      WHERE user_id = #{@user.id})
      UNION
      (SELECT
      'comments' AS table_type,
      id AS id,
      created_at AS time
      FROM comments WHERE number_of_marks IS NULL OR number_of_marks = 0
      and user_id = #{@user.id})
      ) result
      ORDER BY time DESC LIMIT #{offset}, #{limit};"
              # call get_log_activity(sql_stmt) to ececute sql stmt and returns array of activity records
              @log_records = get_log_activity(sql_stmt)
              @url_params = params.clone
            end
            # end

    elsif @tab == "collections"
      @page = params[:page] ? params[:page].to_i : 1
      offset = (@page > 1) ? (@page - 1) * TAB_PAGE_SIZE : 0
      if current_user
        @total_number = Collection.count(:conditions => "user_id = #{@user.id}")
        @lastPage = @total_number ? ((@total_number).to_f/TAB_PAGE_SIZE).ceil : 0
        @collections = Collection.where("user_id = #{@id}").limit(TAB_PAGE_SIZE).offset(offset)
      else
        @total_number = Collection.count(:conditions => "user_id = #{@user.id} AND is_public = true")
        @lastPage = @total_number ? ((@total_number).to_f/TAB_PAGE_SIZE).ceil : 0
        @collections = Collection.where("user_id = #{@id} and is_public = true").limit(TAB_PAGE_SIZE).offset(offset)
      end
      @url_params = params.clone
    end
  end

  # POST /users/recover_password
  def recover_password
    return redirect_to :controller => :users, :action => :show, :id => session[:user_id] if is_loggged_in?
    if verify_recaptcha
      @email = params[:user][:email]
      return redirect_to users_forgot_password_path unless @email

      if @email.blank?
        flash.now[:error] = I18n.t(:invalid_email_address)
        flash.keep
        redirect_to users_forgot_password_path
      else
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
    else
      flash.now[:error] = I18n.t(:form_validation_errors_for_attribute_assistive)
      flash.keep
      redirect_to users_forgot_password_path
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
    session[:login_attempts] ||= 0
    @verify_captcha = true if (session[:login_attempts].to_i  >= LOGIN_ATTEMPTS)
  end

  # POST /users/validate
  def validate
    return redirect_to :controller => :users, :action => :show, :id => session[:user_id] if is_loggged_in?
     username = params[:user][:username]
     password = params[:user][:password]
      if ((session[:login_attempts].to_i >= LOGIN_ATTEMPTS) && !(verify_recaptcha))
      flash.now[:error] = I18n.t(:captcha_error)
      flash.keep
      redirect_to :controller => :users, :action => :login
    else
      @user = User.authenticate(username, password)
      if @user.nil?
        flash.now[:error] = I18n.t(:sign_in_unsuccessful_error)
        flash.keep
        session[:login_attempts] = session[:login_attempts].to_i + 1
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
  end

  # GET /users/:id/edit
  def edit
    if authenticate_user
      @page_title = I18n.t(:modify_profile)
      @action = "modify"
      @verify_captcha = false
      @user = User.find_by_id(params[:id])
      @user.email_confirmation = @user.email
    end
  end

  #PUT /users
  def update
    if authenticate_user
      @user = User.find(params[:id])
      user_attr = params[:user]

      if (!(params[:user][:photo_name].nil?))
        file = user_attr[:photo_name].original_filename
        if(file[file.length-5].chr == '.')
          user_attr[:photo_name].original_filename = "#{file[0,file.length-5]}#{DateTime.now.to_s}.#{file[file.length-4,file.length]}"
        else
          user_attr[:photo_name].original_filename = "#{file[0,file.length-4]}#{DateTime.now.to_s}.#{file[file.length-3,file.length]}"
        end
      end

      if(!(user_attr[:old_password].nil?) && !(user_attr[:old_password].blank?))
        if(!(User.authenticate(user_attr[:username],user_attr[:old_password])))
          flash.now[:error] = I18n.t("invalid_old_password")
          flash.keep
          @action = "modify"
          render :action => :edit
          return
        end
      end

      #          if params[:user][:entered_password].blank? && params[:user][:entered_password_confirmation].blank?
      #            params[:user][:entered_password] = nil
      #            params[:user][:entered_password_confirmation] = nil
      #          end
      if @user.update_attributes(user_attr)
        if ((params[:delete_photo]))
          delete_user_photo(params[:id])
        end
        log_out
        log_in(@user) # to make sure everything is loaded properly
        flash.now[:notice] = I18n.t("changes_saved")
        flash.keep
        return redirect_to :controller => :users, :action => :show, :id => params[:id]
      else
        flash.keep
        @action = "modify"
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
     redirect_to :controller => :users, :action => :show, :id => user_id, :tab => "history", :page => params[:page]
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
      redirect_to :controller => :users, :action => :login
    end
  end

  private

  def delete_user_photo(id)
    user = User.find(id)
    FileUtils.remove_dir("#{Rails.root}/public/users/#{id}") if File.directory? "#{Rails.root}/public/users/#{id}"
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
end

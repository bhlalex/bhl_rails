class UsersController < ApplicationController
  layout 'users'
  
  include BHL::Login
  
  def new
    redirect_to root_path if is_loggged_in?
    @page_title = I18n.t(:sign_up)
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.valid? && verify_recaptcha
      @user.save
      log_in(@user)
      Notifier.user_verification(@user, url)
      flash.now[:notice] = I18n.t(:registration_welcome_message, :real_name => @user.real_name)
      flash.keep
      redirect_to :controller => :users, :action => :show, :id => @user.id
    else
      @page_title = I18n.t(:sign_up)
      @user.errors.add('recaptcha', I18n.t("form_validation_errors_for_attribute_assistive")) unless verify_recaptcha 
      render :action => :new
    end
  end

  def forgot_password
  end

  def change_password
  end

  def edit_profile
  end
  
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
      @user.active = 1
      @user.verified_date = Time.now
      @user.save
      flash.now[:notice] = I18n.t(:account_activated, :real_name => @user.real_name)
      flash.keep
      if is_loggged_in?
        log_out
        log_in(@user) # to make sure evenrything is loaded properly
      end
      redirect_to root_path
    end
  end

  def show
    @id = params[:id]
    @id = session[:user_id] if @id.nil? 
    return redirect_to root_path if @id.nil?
    @user = User.find_by_id(@id)
    return redirect_to root_path if @user.nil?
    
    @can_edit = @id.to_i == session[:user_id]
    
    @page_title = @user.real_name
  end
  
  def logout
    log_out
    redirect_to root_path
  end
  
  def login
    
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@user) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@user) }
      end
    end
  end
end

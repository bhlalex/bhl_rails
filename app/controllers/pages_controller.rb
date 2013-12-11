class PagesController < ApplicationController
  layout 'pages'
  def about
    @page_title = I18n.t(:about_us_page_header)
  end
  
  def contact
    @page_title = I18n.t(:contact_us_page_header)
    @email_message = EmailMessage.new
    @verify_captcha = true
  end
  
  def send_message
    @email_message = EmailMessage.new(params[:email_message])
    if @email_message.valid? && verify_recaptcha
          @email_message.save
#          url = "#{request.host}:#{request.port}/users/activate/#{@user.guid}/#{@user.verification_code}"
#          Notifier.user_verification(@user, url)
          flash.now[:notice] = I18n.t(:contact_us_message)
          flash.keep
          redirect_to :controller => :pages, :action => :contact
        else
          @verify_captcha = true
          @page_title = I18n.t(:contact_us_link)
          @email_message.errors.add('recaptcha', I18n.t("form_validation_errors_for_attribute_assistive")) unless verify_recaptcha
          render :action => :contact
        end
  end
end

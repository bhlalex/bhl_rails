class PagesController < ApplicationController
  layout 'pages'
  def about
    @page_title = I18n.t(:about_us_page_title)
  end

  # provide users with form to send email to site master
  def contact
    @page_title = I18n.t(:contact_us_page_title)
    @email_message = EmailMessage.new
    @verify_captcha = true
  end

  # send_message: to send email message to site master
  # using enterd name, email, subject and message body entered by user
  # also store email message paramters in email_messages table
  def send_message
    @email_message = EmailMessage.new(params[:email_message])
    if @email_message.valid? && verify_recaptcha
      @email_message.save
      # use action mailer to send email message incase of valid message paramteres
      if Notifier.contact_message(params[:email_message][:name],params[:email_message][:email],
      params[:email_message][:subject],
      params[:email_message][:message]).deliver
        flash.now[:notice] = I18n.t(:contact_us_message)
        flash.keep
      end
      redirect_to :controller => :pages, :action => :contact
    else
      @verify_captcha = true
      @page_title = I18n.t(:contact_us_link)
      @email_message.errors.add('recaptcha', I18n.t("form_validation_errors_for_attribute_assistive")) unless verify_recaptcha
      render :action => :contact
    end
  end
end

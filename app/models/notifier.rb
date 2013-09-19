class Notifier < ActionMailer::Base
  
  helper :application
  
  def user_activated(user)
    @user = user
    mail(
      :content_type => "text/html",
      :subject => I18n.t(:subject, :scope => [:notifier, :user_activated]),
      :to => user.email,
      :from => NO_REPLY_EMAIL_ADDRESS )
  end

  def user_verification(user, url)
    @user = user
    @verification_url = url
    mail(
      :content_type => "text/html",
      :subject => I18n.t(:subject, :scope => [:notifier, :user_verification]),
      :to => user.email,
      :from => NO_REPLY_EMAIL_ADDRESS )
  end
  
  def user_reset_password_verification(user, reset_password_url)
    @user = user
    @reset_password_url = reset_password_url
    mail(
      :content_type => "text/html",
      :subject => I18n.t(:subject, :scope => [:notifier, :user_recover_account]),
      :to => user.email,
      :from => NO_REPLY_EMAIL_ADDRESS )
  end
end
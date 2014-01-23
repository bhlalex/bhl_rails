class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  
   private
    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end
    
    def set_locale
      I18n.locale = params[:locale] || session[:locale] || extract_locale_from_accept_language_header || I18n.default_locale
      Rails.application.routes.default_url_options[:locale]= I18n.locale 
      session[:locale] =  I18n.locale
    end
end
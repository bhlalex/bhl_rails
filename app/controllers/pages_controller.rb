class PagesController < ApplicationController
  layout 'pages'
  def about
    @page_title = I18n.t(:about_us_page_header)
  end
  
  def contact
    @page_title = I18n.t(:contact_us_page_header)
  end
end

class PagesController < ApplicationController
  layout 'application'
  def about
    @page_title = "About us"
  end
end

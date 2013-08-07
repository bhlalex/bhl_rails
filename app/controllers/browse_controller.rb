class BrowseController < ApplicationController
  include SolrHelper
  include BrowseHelper
  layout 'browse'
  def show
    @alphas = ('A' .. 'Z').to_a
    if params[:char] == 'all'
      @char = ''
    elsif params[:char] == 'misc'
      @char = '' #add regex here
    else
      @char = params[:char]    
    end
    #@char = params[:char] != nil ? params[:char] : 'a' 
    @type = params[:type]
    if @type == 'subjects'
      @page_title = I18n.t(:browse_subject_page_header)
    elsif @type == 'authors'
      @page_title = I18n.t(:browse_author_page_header) 
    end
    @browse_list = list_facet_by_prefix(@type[0..-2], @char.upcase)
  end
end
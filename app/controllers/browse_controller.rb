class BrowseController < ApplicationController
  include SolrHelper
  include BrowseHelper
  layout 'browse'
  def show
    @search = params[:search] if params[:search]
    @alphas = ('A' .. 'Z').to_a
    if params[:char].nil? || params[:char] == 'all'
      @char = ''
    else
      @char = params[:char]
    end
    #@char = params[:char] != nil ? params[:char] : 'a' 
    @type = params[:type]
    if @type == 'subjects'
      @page_title = I18n.t(:browse_subject_page_header)
      @search_prefix = "subject"
    elsif @type == 'authors'
      @page_title = I18n.t(:browse_author_page_header)
       @search_prefix = "author"
    end
    if(!@search.nil?)
      @browse_list = solr_autocomplete(@type[0..-2], @search, 100000)
    else  
      @browse_list = list_facet_by_prefix(@type[0..-2], @char.upcase)
    end
  end
  
  def autocomplete
    type = params[:type]
    term = "#{params[:term]}"
    @results = []
    response = solr_autocomplete(type[0..-2], term, 4)
    
    response.each do |item|
      @results << item.value
    end 
    if (@results.length == 0)
      @results << "#{I18n.t(:no_suggestion)}"
    end
    render json: @results
  end
end
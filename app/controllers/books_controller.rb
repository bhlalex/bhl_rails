require 'jquery-rails'
require "rexml/document"

class BooksController < ApplicationController
  include BooksHelper
  include SolrHelper
  
  def index
    @user_history = UserBookHistory.where(:user_id => session[:user_id])
    @url_params = fix_dar_url(params)
    @page_title = I18n.t(:search_results_colon)
    @query_array = {'ALL' => [], 'title'=> [], 'language'=> [], 'published_at'=> [], 'geo_location'=> [],
                    'author'=> [], 'name'=> [], 'subject'=> [], 'content'=> [], 'date'=> []}
    
    @selectoptions = {I18n.t(:selection_all_option) => "ALL",
                      I18n.t(:book_title_title) => "title",
                      I18n.t(:book_language_title) => "language",
                      I18n.t(:book_publish_place_title) => "published_at",
                      I18n.t(:book_location_title) => "geo_location",
                      I18n.t(:book_author_title) => "author",
                      I18n.t(:book_name_title) => "name",
                      I18n.t(:book_subject_title) => "subject",
                      I18n.t(:book_title_title) => "content"}
                      
    @page = @url_params[:page] ? @url_params[:page].to_i : 1
    @view = @url_params[:view] ? @url_params[:view] : ''
    @lang = 'test'
    
    @query_array = set_query_array(@query_array, @url_params)
    @query = set_query_string(@query_array, false)
    
    @response = search_facet_highlight(@query, @page)
    @lastPage = @response['response']['numFound'] ? (@response['response']['numFound'].to_f/PAGE_SIZE).ceil : 0
  end
  
  def show
    if(session[:book_id] != nil && session[:book_id] != params[:id].to_i)
      BookView.new(:book_id1 => session[:book_id], :book_id2 => params[:id].to_i)
    end
    session[:book_id] = params[:id].to_i  
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    search = rsolr.select :params => { :q => "vol_jobid:" + params[:id]}
    @book = search['response']['docs'][0]
    @thumb = "volumes/#{params[:id]}/thumb.jpg"
    @page_title = @book['bok_title'][0]
    @tabs = {:brief => I18n.t(:brief), :mods => I18n.t(:mods), :bibtex => I18n.t(:bibtex), :endnote => I18n.t(:endnote)}
    @current = params[:tab] != nil ? params[:tab] : 'brief' 
    if @current != 'read'
      if @current == 'brief'
        #Hash types holds some of the metadata "types" of a book 
        #(in particularly, the types that are saved in arrays in solr indexing)
        @types = {:author => I18n.t(:book_author_title), 
                  :geo_location => I18n.t(:book_publish_place_title),
                  :subject => I18n.t(:book_subject_title),
                 }
      elsif @current == 'mods'
        mods = Book.find_by_id(Volume.find_by_job_id(params[:id]).book_id).mods
        mods.slice!(0) if mods[0] == "?" # This should remove leading "?" from mods
        
        # this is used to beautify xml display 
        doc = REXML::Document.new mods
        out = ""
        doc.write(out, 1)
        @format = out
      elsif @current == 'bibtex'
        bibtex = Book.find_by_id(Volume.find_by_job_id(params[:id]).book_id).bibtex
        bibtex = bibtex[1..-1] if bibtex[0] == "?"
        @format = bibtex
      elsif @current == 'endnote'
        endnote = Book.find_by_id(Volume.find_by_job_id(params[:id]).book_id).endnote
        endnote = endnote[1..-1] if endnote[0] == "?"
        @format = endnote
      else
        @format = 'empty for now'
      end
    else
      @reader_path = (DAR_VIEWER.sub DAR_VIEWER_REPLACE_STRING, params[:id]).sub DAR_VIEWER_REPLACE_LANGUAGE, I18n.locale.to_s
    end
    #save user history
    save_user_history(params)
    
    render layout: 'books_details'
  end
  
  def autocomplete
    type = params[:type]
    term = params[:term]
    @results = []
    response = solr_autocomplete(type, term, AUTOCOMPLETE_MAX)
    response.each do |item|
      @results << item.value
    end 
    if (@results.length == 0)
      @results << "No Suggestion"
    end
    render json: @results
  end

  private
    def save_user_history(params)
      user = User.find_by_id(session[:user_id])
      if(!user.nil?)
        volume = Volume.find_by_job_id(params[:id])
        history = UserBookHistory.where(:volume_id => volume.id, :user_id => user.id)
        if(history.count == 0)
          ubh = UserBookHistory.new
          ubh.user = user
          ubh.volume = volume
          ubh.last_visited_date = Time.now
          ubh.save
        else
          history[0].last_visited_date = Time.now
          history[0].save
        end
      end
    end
end
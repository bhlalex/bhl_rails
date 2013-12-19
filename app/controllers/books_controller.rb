require 'jquery-rails'
require "rexml/document"

class BooksController < ApplicationController
  include ApplicationHelper
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
    @sort = @url_params[:sort_type] ? @url_params[:sort_type] : '' # get sort options (rate or views) from params
    @lang = 'test'
    @query_array = set_query_array(@query_array, @url_params)
    @query = set_query_string(@query_array, false)
    @response = search_facet_highlight(@query, @page,@sort)
    @lastPage = @response['response']['numFound'] ? (@response['response']['numFound'].to_f/PAGE_SIZE).ceil : 0
end
  
  def show
    @volume_id = Volume.find_by_job_id(params[:id]).id
      # books comments 
    #@comments_replies_list = get_comments( "volume", nil, params[:id])
    @comment = Comment.new
    
    if(session[:book_id] != nil && session[:book_id] != params[:id].to_i)
      BookView.create(:book_id1 => session[:book_id], :book_id2 => params[:id].to_i)
    end
    session[:book_id] = params[:id].to_i  
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    search = rsolr.select :params => { :q => "vol_jobid:" + params[:id]}
    @book = search['response']['docs'][0]
    @thumb = "volumes/#{params[:id]}/thumb.jpg"
    @page_title = @book['bok_title'][0]
    
    book_module = Book.find_by_id(Volume.find_by_job_id(params[:id]).book_id)
    
    @meta_keywords = book_module.meta_keywords
    @meta_description = book_module.meta_description
    @meta_author = book_module.meta_author
    
    @tabs = {:brief => I18n.t(:brief), :mods => I18n.t(:mods), :bibtex => I18n.t(:bibtex), :endnote => I18n.t(:endnote),:collections => I18n.t(:collections)}
    @current = params[:tab] != nil ? params[:tab] : 'brief'
    
    if @current != 'read'
      #Hash types holds some of the metadata "types" of a book 
      #(in particularly, the types that are saved in arrays in solr indexing)
      @types = {:author => I18n.t(:book_author_title), 
                :geo_location => I18n.t(:book_publish_place_title),
                :subject => I18n.t(:book_subject_title),
               }        
      #book collections carousel
      @collections = Collection.find_by_sql("SELECT collections.id, 
                                                CONCAT(\'#{COLLECTION_FOLDER}\', collections.id , '/' , collections.photo_name) AS photo_url
                                              FROM collections 
                                              INNER JOIN book_collections
                                                ON (collections.id = book_collections.collection_id)
                                             WHERE book_collections.volume_id=#{Volume.find_by_job_id(params[:id]).id} 
                                              AND collections.status = false")
      #users also viewed carousel
      @also_viewed_books = also_viewed_books(params[:id].to_i)
      #related books carousel
      @related_books = related_books(params[:id])
    else #If tab is read (darviewer application)
      #save user history
      save_user_history(params)
      @reader_path = (DAR_JAR_API_URL.sub DAR_JAR_API_URL_STRING, params[:id]).sub DAR_JAR_API_URL_LANGUAGE, I18n.locale.to_s
    end
    # user rate for current volume
    volume = Volume.find_by_job_id(params[:id])
    @book_rate = 0.0
    @book_rate = volume.rate if volume.rate

    # when user rate == -1 this means that he never rated this book before
    @user_rate = -1
    book_rate_list = BookRating.where(:user_id => session[:user_id], :volume_id => volume.id)
    if book_rate_list.count > 0
      @user_rate = book_rate_list[0].rate
    end
    test = "test"
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
  
  def get_collections
    start = params[:start].to_i * LIMIT_BOOK_COLLECTIONS.to_i
    limit = LIMIT_BOOK_COLLECTIONS
    @collections = Collection.find_by_sql("SELECT * 
                                              FROM collections 
                                              INNER JOIN book_collections
                                                ON (collections.id = book_collections.collection_id)
                                             WHERE book_collections.volume_id=#{Volume.find_by_job_id(params[:id]).id} 
                                              AND collections.status = false LIMIT #{start}, #{limit}")
    #render :partial => "get_collections" 
    # render :layout => 'main' # this is a blank layout as I don't need any layout in this action
    respond_to do |format|
      format.html {render :partial => "books/get_collections"}
    end
  end
  
  
def get_comments
  @comment = Comment.new
  start = params[:start].to_i * LIMIT_BOOK_COMMENTS.to_i
  limit = LIMIT_BOOK_COMMENTS
  @comments = Comment.find_by_sql("SELECT * 
                                            FROM comments 
                                           WHERE comments.volume_id=#{Volume.find_by_job_id(params[:id]).id} 
                                            AND comments.comment_id IS NULL
                                            ORDER BY comments.created_at
                                            LIMIT #{start}, #{limit}")
  #render :partial => "get_collections" 
  # render :layout => 'main' # this is a blank layout as I don't need any layout in this action
  respond_to do |format|
    format.html {render :partial => "books/get_comments"}
  end
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
          update_solr_views(volume)
        else
          history[0].last_visited_date = Time.now
          history[0].save
        end
      end
    end
end
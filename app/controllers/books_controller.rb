require 'jquery-rails'
require "rexml/document"

class BooksController < ApplicationController
  include ApplicationHelper
  include BooksHelper
  include SolrHelper
  include BHL::Login
  
  def index
    @user_history = UserBookHistory.where(:user_id => session[:user_id])
    @url_params = fix_dar_url(params)
    @page_title = I18n.t(:search_results_colon)
    @query_array = {'ALL' => [], 'title'=> [], 'language'=> [], 'published_at'=> [], 'geo_location'=> [],
                    'author'=> [], 'name'=> [], 'subject'=> [], 'content'=> [], 'date'=> [], 'publisher'=> []}
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
    @query_array = set_query_array(@query_array, @url_params)
    @query = set_query_string(@query_array, false)
    @response = search_facet_highlight(@query, @page, PAGE_SIZE, @sort)
    @lastPage = @response['response']['numFound'] ? (@response['response']['numFound'].to_f/PAGE_SIZE).ceil : 0
  end
  
  def show
    @comment = Comment.new
    
    #Save old and new books ids for "user_also_viewed" feature
    if(session[:book_id] != nil && session[:book_id] != params[:id].to_i)
      BookView.create(:book_id1 => session[:book_id], :book_id2 => params[:id].to_i)
    end
    session[:book_id] = params[:id].to_i
    #end
    
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    search = rsolr.select :params => { :q => "vol_jobid:" + params[:id]}
    @book = search['response']['docs'][0]
    @page_title = @book['bok_title'][0]
    @volume = Volume.find_by_job_id(params[:id])
    @volume_id = @volume.id
    
    if @volume[:get_thumbnail_fail] == 0
      @thumb = "volumes/#{params[:id]}/thumb.jpg"
    else
      @thumb = "images_#{I18n.locale}/#{I18n.t(:default_book)}"
    end
      
    #For SEO purpose
    book_module = Book.find_by_id(Volume.find_by_job_id(params[:id]).book_id)
    @meta_keywords = book_module.meta_keywords
    @meta_description = book_module.meta_description
    @meta_author = book_module.meta_author
    #End SEO
    
    @current = params[:tab] != nil ? params[:tab] : 'brief'
    
    if @current != 'read'
      #Hash types holds some of the metadata "types" of a book 
      #(in particularly, the types that are saved in arrays in solr indexing)
      @types = {:author => I18n.t(:book_author_title), 
                :geo_location => I18n.t(:book_publish_place_title),
                :subject => I18n.t(:book_subject_title),
               }
    else #If tab is read (darviewer application)
      #save user history
      save_user_history(params)
      @reader_path = (DAR_JAR_API_URL.sub DAR_JAR_API_URL_STRING, params[:id]).sub DAR_JAR_API_URL_LANGUAGE, I18n.locale.to_s
    end
    
    # when user rate == 0 this means that he never rated this book before
    @user_rate = 0.0
    if !session[:user_id].nil?
      book_rate_list = VolumeRating.where(:user_id => session[:user_id], :volume_id => @volume.id)
      if book_rate_list.count > 0
        @user_rate = book_rate_list[0].rate 
      end
    end    
    
    @collections_count = Collection.get_count_by_volume(@volume_id, session[:user_id])
    @collectionspages = ( @collections_count / LIMIT_CAROUSEL.to_f).ceil
    @viewspages =  (@volume.view_count / LIMIT_CAROUSEL.to_f).ceil
    response = rsolr.find :q => get_solr_related(params[:id]), :fl => "vol_jobid"
    @relatedpages = ((response['response']['numFound']) / LIMIT_CAROUSEL.to_f).ceil
  end
  
  def rating
    volume = Volume.find_by_job_id(params[:jobid]) 
    unless session[:user_id].nil? || params[:rate] != "NaN"
      rate = params[:rate].to_f
      #allow user to rate as long as he is logged in
      volume_rate_list = VolumeRating.where(:user_id => session[:user_id], :volume_id => volume.id)
      
      #create new or updat existing
      if volume_rate_list.count == 0
        #create
        volume_rate = VolumeRating.create!(:user_id => session[:user_id], :volume_id => volume.id, :rate => rate)
      else
        #update
        volume_rate = volume_rate_list[0]
        volume_rate.rate = rate
      end
      volume_rate.save
      #update volume global rate
      volume = volume.set_rate
      data = volume.rate
      #NEW_LAYOUT CODE TO ADD RATE TO SOLR
      update_solr_rate(volume)
      render :json => data
    else
      #redirect to login    
      #redirect_to :controller => :users, :action => :login
      render :json => 0
    end
    
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
      @results << "#{I18n.t(:no_suggestion)}"
    end
    render json: @results
  end
  def get_carousel
    start = params[:start].to_i * LIMIT_CAROUSEL.to_i
    limit = LIMIT_CAROUSEL
    @divname = params[:divname]
    @pages = params[:pages]
    @start = params[:start]
    if params[:divname] == 'collectionscarousel'
      @carouseltitle =I18n.t(:book_details_found_collections)
      @controller = "collections"
      @action = "show"  
      @total_array = getcollections(params[:id], start, limit)
    elsif params[:divname] == 'viewscarousel'
      @carouseltitle = I18n.t(:book_details_user_viewed)
      @controller = "books"
      @action = "show"
      @total_array = getalsoviewed(params[:id], start, limit)
    elsif params[:divname] == 'relatedcarousel'
      @carouseltitle = I18n.t(:book_details_related)
      @controller = "books"
      @action = "show" 
      @total_array = getrelated(params[:id], start, limit)  
    end
    
    respond_to do |format|
      format.html {render :partial => "books/carousel"}
    end
  end
  
  def get_detailed_rate
    @rate_array=[]
      (1..5).each do |n|
        @rate_array <<  VolumeRating.where(:rate => n.to_f, :volume_id => Volume.find_by_job_id(params[:jobid])).count
      end
    respond_to do |format|
      format.html {render :partial => "books/detailed_rate"}
    end
  end
  
  def get_comments
    @start = params[:start]
    @comment = Comment.new
    @total_comments = Comment.where("comments.volume_id=? AND comments.comment_id IS NULL", Volume.find_by_job_id(params[:id]).id).count
    start = params[:start].to_i * LIMIT_BOOK_COMMENTS.to_i
    limit = LIMIT_BOOK_COMMENTS
    @comments = Comment.find_by_sql("SELECT * 
                                     FROM comments 
                                     WHERE comments.volume_id=#{Volume.find_by_job_id(params[:id]).id} 
                                     AND comments.comment_id IS NULL
                                     ORDER BY comments.created_at
                                     LIMIT #{start}, #{limit}")
    respond_to do |format|
      format.html {render :partial => "books/get_comments"}
    end
  end

  private
    def save_user_history(params)
      user = User.find_by_id(session[:user_id])
      volume = Volume.find_by_job_id(params[:id])
      ubh = UserBookHistory.new
      ubh.user = user
      ubh.volume = volume
      ubh.updated_at = Time.now
      ubh.save
      update_solr_views(volume)
    end
    def getcollections(id, start, limit)
      # user id is removed so that only the public collections will be displayed
      Collection.find_by_sql("SELECT collections.id, collections.title
                  FROM collections 
                  INNER JOIN volume_collections
                    ON (collections.id = volume_collections.collection_id)
                 WHERE volume_collections.volume_id=#{Volume.find_by_job_id(id).id} 
                 AND collections.is_public = true
                  LIMIT #{start}, #{limit};")
    end
    def getalsoviewed(id, start, limit)
      #Book.find_by_sql("SELECT result.id, result.photo_url
                              # FROM ((SELECT bv1.book_id1 AS id, COUNT(*) AS total_count, 
                                          # IF(V1.get_thumbnail_fail IS NOT NULL, 
                                              # CONCAT('/volumes/', V1.job_id, '/thumb.jpg'), NULL
                                          # ) AS photo_url
                                      # FROM book_views AS bv1
                                      # INNER JOIN volumes as V1
                                          # ON (bv1.book_id1 = V1.job_id)
                                      # WHERE bv1.book_id2 = #{id}
                                          # GROUP BY id)
                              # UNION(SELECT bv2.book_id2 AS id, COUNT(*) AS total_count, 
                                          # IF(V2.get_thumbnail_fail IS NOT NULL, 
                                              # CONCAT('/volumes/', V2.job_id, '/thumb.jpg'), NULL
                                          # ) AS photo_url
                                      # FROM book_views AS bv2
                                      # INNER JOIN volumes as V2
                                          # ON (bv2.book_id2 = V2.job_id)
                                      # WHERE bv2.book_id1 = #{id}
                                      # GROUP BY id)
                              # )result GROUP BY result.id ORDER BY total_count DESC;")
      Book.find_by_sql("SELECT result.id, result.title
                          FROM ((SELECT BV1.book_id1 AS id, B1.title, COUNT(*) AS total_count
                                    
                                FROM book_views AS BV1
                                INNER JOIN volumes as V1
                                    ON (BV1.book_id1 = V1.job_id)
                                INNER JOIN books as B1
                                    ON (V1.book_id = B1.id)
                                WHERE BV1.book_id2 = #{id}
                                    GROUP BY id)
                          UNION
                          (SELECT BV2.book_id2 AS id, B2.title, COUNT(*) AS total_count
                                    
                                FROM book_views AS BV2
                                INNER JOIN volumes as V2
                                    ON (BV2.book_id2 = V2.job_id)
                                INNER JOIN books as B2
                                    ON (V2.book_id = B2.id)
                                WHERE BV2.book_id1 = #{id}
                                GROUP BY id)
                          )result GROUP BY result.id ORDER BY total_count DESC LIMIT #{start}, #{limit};") 
    end
    
    def getrelated(id, start, limit)
     query = get_solr_related(id)
     return_field = "vol_jobid,bok_title"
     rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
     response = rsolr.find :q => query, :fl => return_field, :start => start, :rows => limit
     total_array = fill_related_carousel_array(response, id)  
    end
    def fill_related_carousel_array(response, id)
      total_array = []
      response['response']['docs'].each do |doc|
        if(doc['vol_jobid'].to_i != id.to_i)
          element = {}
          element[:id] = doc[:vol_jobid]
          element[:title] = doc[:bok_title][0]
          total_array << element
        end
      end
      total_array
    end
  def get_solr_related(id)
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    #origin_book_names = rsolr.find :q => "vol_jobid:(#{volume_id})", :fl => "name"
    origin_book_names=  Name.find_by_sql("
        SELECT names.*, COUNT(page_names.name_id) as count
                  FROM names
                    INNER JOIN page_names ON (page_names.name_id = names.id)
                    INNER JOIN pages ON(page_names.page_id = pages.id)
                    INNER JOIN volumes ON (volumes.id = pages.volume_id)
                    WHERE volumes.job_id = #{id}
                    GROUP BY name_id 
                    ORDER BY count DESC
                    LIMIT 0,#{MAX_NAMES_PER_BOOK}
      ")
    book_title = Book.find_by_id(Volume.find_by_job_id(id).book_id).title
    book_title = book_title.gsub(/\s+/) {" \" AND \" "} if book_title.split(" ").length > 1
    query = "bok_title:(\"#{book_title}\")"
    if ((origin_book_names != nil) && (origin_book_names.count > 0))
      query+= " OR name:(\""
      origin_book_names.each do |name|
        if name.string!=nil
          name.string = name.string.gsub(/\s+/) {" \" AND \" "} if name.string.split(" ").length > 1
          query+= "(#{name.string}) \" OR \" " 
        end
      end
      query = query[0,query.length-7] #-7 to remove "Last OR and double quotes"
      query+= "\")"
    end
    query
  end
end
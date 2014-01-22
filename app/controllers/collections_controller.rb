class CollectionsController < ApplicationController
  include ApplicationHelper
  include BHL::Login
  include BooksHelper
  
  def index
    @page_title = I18n.t(:collection_title)
    
    sql_query = "is_public = true"
    sql_query+= " AND title LIKE '%#{params[:search]}%'" if !params[:search].nil?
    
    @page = params[:page] ? params[:page].to_i : 1
    
    @collections = Collection.where(sql_query).order(params[:sort_type]).limit(COLLECTION_PAGE_SIZE).offset((@page-1)*COLLECTION_PAGE_SIZE)
    if !params[:search].nil?
      @collections_total_number = Collection.count(:all, :conditions => "is_public = 1 AND title LIKE '%#{params[:search]}%'")
    else
      @collections_total_number = Collection.count(:all, :conditions => "is_public = 1")
    end
    @lastPage = @collections_total_number ? ((@collections_total_number).to_f/COLLECTION_PAGE_SIZE).ceil : 0
    @url_params = params.clone
  end

  def show
    @page_title = I18n.t(:show_collection_detail)
    @collection = Collection.find(params[:id])
    
    if @collection.is_public == true || authenticate_user(@collection.user_id)
      @collection_id = params[:id]
      @volume_id = nil
#      @comments_replies_list = get_comments( "collection", params[:id], nil)
      @comment = Comment.new
      rate_list = CollectionRating.where(:user_id => session[:user_id], :collection_id => @collection.id)
      if rate_list.count > 0
        @user_rate = rate_list[0].rate
      else
        @user_rate = 0.0
      end
      @collection_volumes = @collection.volume_collections.order('position ASC')
      @total_number = @collection_volumes.count
      @view = params[:view] ? params[:view] : 'list'
      @page = params[:page] ? params[:page].to_i : 1
      @lastPage = @collection_volumes.count ? ((@collection_volumes.count).to_f/PAGE_SIZE).ceil : 0
      limit = PAGE_SIZE
      offset = (@page > 1) ? (@page - 1) * limit : 0
      @collection_volumes = @collection_volumes.limit(limit).offset(offset)
      @url_params = params.clone
    end
  end

  def dialog_content
    @dialog_number = params[:number]
    @collections = Collection.where(:user_id => session[:user_id])
    @disabled = []
    @collections.each do |col|
      vol_id = Volume.find_by_job_id(params[:vol_jobid]).id
      found = VolumeCollection.where(:volume_id => vol_id, :collection_id => col.id)
      if found.count > 0
        @disabled.push(1)
      else
        @disabled.push(0)
      end
    end
    render :layout => 'main' # this is a blank layout as I don't need any layout in this action
  end

  def destroy_collection
    collection = Collection.find(params[:id])
    if authenticate_user(collection.user_id)
      collection.destroy
      # destroy rates of this collection
      rates = CollectionRating.where(:user_id => collection.user_id, :id => collection.id)
      rates.each do |rate|
        rate.destroy
      end
      flash[:notice]=I18n.t(:collection_destroyed)
      flash.keep
      if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
        redirect_to :back
      else
        redirect_to :controller => :users, :action => :show, :id => "session[:user_id]", :tab => "collections"
      end
    end
  end

  def add_book
    if is_loggged_in?
      if(params[:col_id])
        add_to_existing_collection(Collection.find_by_id(params[:col_id]))
      else
        add_to_new_collection
      end
    end
  end

  def delete_book
    volume_collection = VolumeCollection.find(params[:volume_collection_id])
    collection = Collection.find(volume_collection.collection)
    if authenticate_user(collection.user_id)
      volume_collection.destroy
      collection[:updated_at] = Time.now
      collection.save
      flash.now[:notice]=I18n.t(:volume_collection_deleted)
      flash.keep
      if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
        redirect_to :back
      else
        redirect_to :controller => :collections, :action => :index
      end
    end
  end



  def edit # edit collection
    @page_title = I18n.t(:edit_collection_page_title)
    @collection = Collection.find(params[:id])
    authenticate_user(@collection.user_id)
  end

  def update
    @collection = Collection.find(params[:id])
    if authenticate_user(@collection.user_id)
      if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
        collection_attr = params[:collection]
        if params[:test] != true
          if (!(params[:collection][:photo_name].nil?))
            file = collection_attr[:photo_name].original_filename
            if(file[file.length-5].chr == '.')
              collection_attr[:photo_name].original_filename = "#{file[0,file.length-5]}#{DateTime.now.to_s}.#{file[file.length-4,file.length]}"
            else
              collection_attr[:photo_name].original_filename = "#{file[0,file.length-4]}#{DateTime.now.to_s}.#{file[file.length-3,file.length]}"
            end
          end
      end
        if @collection.update_attributes(collection_attr)
          @collection[:updated_at] = Time.now
          @collection.save
          flash.now[:notice]=I18n.t(:collection_updated)
          flash.keep
          redirect_to :controller => :users, :action => :show, :id => session[:user_id], :tab => "collections"
        else
          flash.now[:error]=I18n.t(:collection_not_updated)
          flash.keep
          render :action => :edit
        end
      end
    end
  end

  def move_up
    volume_collection = VolumeCollection.find(params[:volume_collection_id])
    collection = Collection.find(volume_collection.collection)
    if authenticate_user(collection.user_id)
      volume_collection.move_higher
      collection[:updated_at] = Time.now
      collection.save
      if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
        redirect_to :back
      else
        redirect_to :controller => :collections, :action => :index
      end
    end
  end

  def move_down
    volume_collection = VolumeCollection.find(params[:volume_collection_id])
    collection = Collection.find(volume_collection.collection)
    if authenticate_user(collection.user_id)
      volume_collection.move_lower
      collection[:updated_at] = Date.today
      collection.save
      if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
        redirect_to :back
      else
        redirect_to :controller => :collections, :action => :index
      end
    end
  end

  def get_collection_comments
    @start = params[:start]
    @comment = Comment.new
    @total_comments = Comment.where("comments.collection_id=? AND comments.comment_id IS NULL", Collection.find_by_id(params[:id]).id).count
    start = params[:start].to_i * LIMIT_BOOK_COMMENTS.to_i
    limit = LIMIT_BOOK_COMMENTS
    @comments = Comment.find_by_sql("SELECT * 
                                              FROM comments 
                                             WHERE comments.collection_id=#{Collection.find_by_id(params[:id]).id} 
                                              AND comments.comment_id IS NULL
                                              ORDER BY comments.created_at
                                              LIMIT #{start}, #{limit}")
    respond_to do |format|
      format.html {render :partial => "collections/get_comments"}
    end
  end
  
  def get_collection_photo
     @collection = Collection.find(params[:id])
     if (@collection.user_id == session[:user_id] && params[:is_delete].to_i == 1)
       @collection[:photo_name] = ''
       @collection.save
      delete_collection_photo(params[:id])
     end
    respond_to do |format|
      format.html {render :partial => "collections/get_collection_photo"}
    end
  end
  
  def autocomplete
    term = "#{params[:term]}%"
    @results = []
    response = Collection.find_by_sql("
      SELECT 
        title, COUNT(id) AS count 
      FROM collections 
      WHERE title LIKE \"#{term}\"
      GROUP BY title 
      ORDER BY count DESC 
      LIMIT 0, 4;
      ")
    response.each do |item|
      @results << item.title
    end 
    if (@results.length == 0)
      @results << "No Suggestion"
    end
    render json: @results
  end
  private

  def add_to_existing_collection(col)
    col_id = col.id
    vol_id = Volume.find_by_job_id(params[:vol_id]).id
    duplicated = VolumeCollection.where(:collection_id => col_id, :volume_id => vol_id)
    if duplicated.count == 0
      position = VolumeCollection.where(:collection_id => col_id).count + 1
      bok_col = VolumeCollection.create!(:volume_id => vol_id, :collection_id => col_id, :position => position)
    end
    col.updated_at = Time.now
    col.save
    data = col_id
    render :json => data
  end

  def add_to_new_collection
    title = params[:title]
    if title.length > 0
      description = params[:description]
      is_public = false
      is_public = true if params[:is_public] == 'on'
      col = Collection.create!(:title => title, :description => description,
      :user_id => session[:user_id], :is_public => is_public)
      add_to_existing_collection(col)
    end
  end

  def delete_collection_photo(id)
    collection = Collection.find(id)
    FileUtils.remove_dir("#{Rails.root}/public/collections/#{id}") if File.directory? "#{Rails.root}/public/collections/#{id}"
    collection[:photo_name] = ''
    collection.save
  end

  def authenticate_user(user_id)
    if !is_loggged_in?
      redirect_to :controller => :users, :action => :login
      return false
    end
    if session["user_id"].to_i != user_id
      flash.now[:error] = I18n.t(:access_denied_error)
      flash.keep
      redirect_to :controller => :collections, :action => :index
      return false
    end
    return true
  end

end
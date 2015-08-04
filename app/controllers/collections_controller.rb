class CollectionsController < ApplicationController
  include ApplicationHelper
  include BHL::Login
  include BooksHelper  
  
  def index    
    sql_query = "is_public = true"
    sql_query+= " AND title LIKE '%#{params[:search]}%'" if params[:search]    
    @page = params[:page] ? params[:page].to_i : 1    
    @collections = Collection.where(sql_query).paginate(page: @page, per_page: COLLECTION_PAGE_SIZE).order(params[:sort_type])
    @url_params = params.clone
  end

  def show
    @collection = Collection.find(params[:id])
    if @collection.is_public == true || authenticate_user(@collection.user_id)
      prepare_collection_reviews
      prepare_collection_rating
      @view = params[:view] ? params[:view] : 'list'
      @page = params[:page] ? params[:page].to_i : 1
      @collection_volumes = @collection.volume_collections.paginate(page: @page, per_page: PAGE_SIZE).order('position ASC')
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
      flash[:notice]=I18n.t(:collection_destroyed)
      flash.keep
      if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
        redirect_to :back
      else
        redirect_to controller: 'users', action: 'show', id: "session[:user_id]", tab: "collections"
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
    @collection = Collection.find(params[:id])
    authenticate_user(@collection.user_id)
  end

  def update
    @collection = Collection.find(params[:id])
    if authenticate_user(@collection.user_id)
      if request.env["HTTP_REFERER"].present? && request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
        @collection_attr = params[:collection]
        set_collection_photo_name
        if @collection.update_attributes(@collection_attr)
          handle_successful_update
        else
          handle_unsuccessful_update
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
    @results = []
    response = Collection.where("title LIKE ?", "#{params[:term]}%").group('title').limit(4).order('count_id desc').count('id')
    response.keys.each do |item|
      @results << item
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
    FileUtils.rm_rf "collections/#{id}" if File.directory? "collections/#{id}"
    collection[:photo_name] = ''
    collection.save
  end

  def authenticate_user(user_id)
    if !is_loggged_in?
      redirect_to controller: 'users', action: 'login'
      return false
    end
    if session[:user_id].to_i != user_id
      redirect_to({controller: 'collections', action: 'index'}, flash: { error: I18n.t(:access_denied_error) })
      return false
    end
    return true
  end
  
  def prepare_collection_rating
    rate_result = CollectionRating.where(:user_id => session[:user_id], :collection_id => @collection.id)
    if rate_result.blank?
      @user_rate = 0.0        
    else
      @user_rate = rate_result[0].rate
    end
  end
  
  def  prepare_collection_reviews
    @comment = Comment.new
  end
  
  def handle_successful_update
    redirect_to({ controller: 'collections', action: 'show', id: @collection.id }, flash: { notice: I18n.t(:collection_updated) })
  end
  
  def handle_unsuccessful_update
    flash.now[:error]=I18n.t(:collection_not_updated)
    render action: 'edit'
  end
  
  def set_collection_photo_name
    unless params[:test]
      if params[:collection][:photo_name]
        image_ext = File.extname(@collection_attr[:photo_name].original_filename)
        @collection_attr[:photo_name].original_filename = "image_#{DateTime.now.to_s}#{image_ext}"
      end
    end
  end  

end

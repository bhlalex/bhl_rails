class CollectionsController < ApplicationController
  include ApplicationHelper
  include BHL::Login
  include BooksHelper
  def index
    @query_array = {'title'=> []}
    @query_array = set_query_array(@query_array, params)
    @query = set_query_string(@query_array, true)
    if(@query != '')
      sql_query = "status = true"
      terms = (@query[7,@query.length]).split(" _AND ")
      terms.each do |term|
        sql_query+= " and title like '%#{term.tr("_", "")}%'"
      end
    else
      sql_query = "status = true"
    end
    @collections = Collection.where(sql_query).order(params[:view])
    if(@collections.nil?)
      @collections_total_number = 0
    else
      @collections_total_number = @collections.count
    end
    @page = params[:page] ? params[:page].to_i : 1
    @lastPage = @collections.count ? ((@collections.count).to_f/PAGE_SIZE).ceil : 0
    limit = PAGE_SIZE
    offset = (@page > 1) ? (@page - 1) * limit : 0
    @collections = @collections.limit(limit).offset(offset)
    @url_params = params.clone
    @user_all_rates = []
    @collections.each do |collection|
      collection_rate_list = CollectionRating.where(:user_id => session[:user_id], :collection_id => collection.id)
      if collection_rate_list.count > 0
        @user_all_rates.push( collection_rate_list[0].rate)
      else
        @user_all_rates.push(0.0)
      end
    end
  end

  def show
    @page_title = I18n.t(:show_collection_detail)
    @collection = Collection.find(params[:id])
    if @collection.status == true || authenticate_user(@collection.user_id)
      @collection_id = params[:id]
      @volume_id = nil
      @comments_replies_list = get_comments( "collection", params[:id], nil)
      @comment = Comment.new
      rate_list = CollectionRating.where(:user_id => session[:user_id], :collection_id => @collection.id)
      if rate_list.count > 0
        @user_collection_rate = rate_list[0].rate
      else
        @user_collection_rate = 0.0
      end
    end
  end

  def dialog_content
    @collections = Collection.where(:user_id => session[:user_id])
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
        redirect_to :controller => :collections, :action => :index
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
    book_collection = BookCollection.find(params[:book_collection_id])
    collection = Collection.find(book_collection.collection)
    if authenticate_user(collection.user_id)
      book_collection.destroy
      collection[:updated_at] = Time.now
      collection.save
      flash.now[:notice]=I18n.t(:book_collection_deleted)
      flash.keep
      if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
        redirect_to :back
      else
        redirect_to :controller => :collections, :action => :index
      end
    end
  end

  def list_books_in_collection
    @page_title = I18n.t(:collection_books)
    @collection = Collection.find(params[:id])
    if @collection.status == true || authenticate_user(@collection.user_id)
      @collection_books = @collection.book_collections.order('position ASC')
      @total_number = @collection_books.count
      @view = params[:view] ? params[:view] : 'list'
      @page = params[:page] ? params[:page].to_i : 1
      @lastPage = @collection_books.count ? ((@collection_books.count).to_f/PAGE_SIZE).ceil : 0
      limit = PAGE_SIZE
      offset = (@page > 1) ? (@page - 1) * limit : 0
      @collection_books = @collection_books.limit(limit).offset(offset)
      @url_params = params.clone
    end
  end

  def edit # edit collection
    @page_title = I18n.t(:edit_collection)
    @collection = Collection.find(params[:id])
    authenticate_user(@collection.user_id)
  end

  def update
    @collection = Collection.find(params[:id])
    if authenticate_user(@collection.user_id)
      if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
        collection_attr = params[:collection]
        if (!(params[:collection][:photo_name].nil?))
          file = collection_attr[:photo_name].original_filename
          if(file[file.length-5].chr == '.')
            collection_attr[:photo_name].original_filename = "#{file[0,file.length-5]}#{DateTime.now.to_s}.#{file[file.length-4,file.length]}"
          else
            collection_attr[:photo_name].original_filename = "#{file[0,file.length-4]}#{DateTime.now.to_s}.#{file[file.length-3,file.length]}"
          end
        end
        if @collection.update_attributes(collection_attr)
          if ((params[:delete_photo]))
            delete_collection_photo(params[:id])
          end
          @collection[:updated_at] = Time.now
          @collection.save
          flash.now[:notice]=I18n.t(:collection_updated)
          flash.keep
          redirect_to :controller => :users, :action => :show, :id => session[:user_id], :tab => "collections"
        else
          flash.now[:notice]=I18n.t(:collection_not_updated)
          flash.keep
          render 'edit'
        end
      end
    end
  end

  def move_up
    book_collection = BookCollection.find(params[:book_collection_id])
    collection = Collection.find(book_collection.collection)
    if authenticate_user(collection.user_id)
      book_collection.move_higher
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
    book_collection = BookCollection.find(params[:book_collection_id])
    book_collection = BookCollection.find(params[:book_collection_id])
    collection = Collection.find(book_collection.collection)
    if authenticate_user(collection.user_id)
      book_collection.move_lower
      collection[:updated_at] = Date.today
      collection.save
      if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
        redirect_to :back
      else
        redirect_to :controller => :collections, :action => :index
      end
    end
  end

  private

  def add_to_existing_collection(col)
    col_id = col.id
    vol_id = Volume.find_by_job_id(params[:vol_id]).id
    duplicated = BookCollection.where(:collection_id => col_id, :volume_id => vol_id)
    if duplicated.count == 0
      position = BookCollection.where(:collection_id => col_id).count + 1
      bok_col = BookCollection.create!(:volume_id => vol_id, :collection_id => col_id, :position => position)
    end
    col.updated_at = Time.now
    col.save
  end

  def add_to_new_collection
    title = params[:title]
    if title.length > 0
      description = params[:description]
      status = false
      status = true if params[:public] == 'on'
      col = Collection.create!(:title => title, :description => description, :created_at => Time.now,
      :user_id => session[:user_id], :status => status)
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
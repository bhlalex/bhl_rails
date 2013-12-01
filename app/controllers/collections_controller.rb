class CollectionsController < ApplicationController
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
  end

  def show
    @page_title = I18n.t(:show_collection_detail)
    @collection = Collection.find(params[:id])
  end

  def create_collection
  end

  def dialog_content
    @collections = Collection.where(:user_id => session[:user_id])
    render :layout => 'main' # this is a blank layout as I don't need any layout in this action
  end

  def destroy_collection
    collection = Collection.find(params[:id])
    collection.destroy
    flash[:notice]=I18n.t(:collection_destroyed)
    flash.keep
    redirect_to :back
  end

  def add_book
    if(params[:col_id])
      add_to_existing_collection(Collection.find_by_id(params[:col_id]))
    else
      add_to_new_collection
    end
  end

  def delete_book
    book_collection = BookCollection.find(params[:book_collection_id])
    book_collection.destroy
    collection = Collection.find(book_collection.collection)
    collection[:last_modified_date] = Time.now
    collection.save
    flash.now[:notice]=I18n.t(:book_collection_deleted)
    flash.keep
    redirect_to :back
  end

  def list_books_in_collection
    @page_title = I18n.t(:collection_books)
    @collection = Collection.find(params[:id])
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

  def edit # edit collection
    @page_title = I18n.t(:edit_collection)
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    dir = File.dirname("public/images_#{I18n.locale}/collections/#{@collection.id}")
    FileUtils.mkdir_p(dir) unless File.directory?(dir)
    uploaded_io = params[:collection][:picture]
    File.open("public/images_#{I18n.locale}/collections/#{@collection.id}/#{uploaded_io.original_filename}", 'wb') do |file|
       file.write(uploaded_io.read)
    end
     @collection[:photo_name] = uploaded_io.original_filename
      @collection[:title] = params[:collection][:title]
      @collection[:description] = params[:collection][:description]
      @collection[:status] = params[:collection][:status]
    if @collection.save
      flash.now[:notice]=I18n.t(:collection_updated)
      flash.keep
      redirect_to :controller => :users, :action => :show, :id => session[:user_id], :tab => "collections"
    else
      flash.now[:notice]=I18n.t(:collection_not_updated)
      flash.keep
      render 'edit'
    end
  end

  def move_up
    book_collection = BookCollection.find(params[:book_collection_id])
    book_collection.move_higher
    collection = Collection.find(book_collection.collection)
    collection[:last_modified_date] = Time.now
    collection.save
    redirect_to :back
  end

  def move_down
    book_collection = BookCollection.find(params[:book_collection_id])
    book_collection.move_lower
    collection = Collection.find(book_collection.collection)
    collection[:last_modified_date] = Date.today
    collection.save
    redirect_to :back
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
    col.last_modified_date = Time.now
    col.save
  end

  def add_to_new_collection
    title = params[:title]
    if title.length > 0
      description = params[:description]
      status = false
      status = true if params[:public] == 'on'
      col = Collection.create!(:title => title, :description => description, :creation_date => Time.now,
      :user_id => session[:user_id], :status => status)
      add_to_existing_collection(col)
    end
  end

end
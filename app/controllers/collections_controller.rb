class CollectionsController < ApplicationController
  include BHL::Login
  include BooksHelper
  def index
  end

  def show
    @page_title = I18n.t(:show_collection_detail)
    @collection = Collection.find(params[:id])
  end

  def create_collection
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
    if @collection.update_attributes(params[:collection])
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
    position = BookCollection.where(:collection_id => col_id).count + 1
    #TODO get the right volume id
    vol_id = Volume.find_by_job_id(params[:id]).id
    bok_col = BookCollection.create!(:volume_id => vol_id, :collection_id => col_id, :position => position)
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
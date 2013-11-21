class CollectionsController < ApplicationController
  include BHL::Login
  
  def index
  end
  
  def show
  end
  
  def create_collection
  end
  
  def destroy_collection
  end
  
  def add_book
#    debugger
#    col_id = params[:col_id] != nil ? params[:col_id] : col_id
    if(params[:col_id])
      add_to_existing_collection(Collection.find_by_id(params[:col_id]))
    else
      add_to_new_collection
    end
  end
  
  def delete_book
  end
  
  private
  def add_to_existing_collection(col)
#    debugger
    col_id = col.id
    position = BookCollection.where(:collection_id => col_id).count + 1
    #TODO get the right volume id
    vol_id = Volume.find_by_job_id(params[:id]).id
    bok_col = BookCollection.create!(:volume_id => vol_id, :collection_id => col_id, :position => position)
    col.last_modified_date = Time.now
    col.save
  end
  
  def add_to_new_collection
#    debugger
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
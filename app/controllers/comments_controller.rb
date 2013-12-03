class CommentsController < ApplicationController
 
  def index
    # (collection_id or volume_id), type = "collection, volume"
  end
  
  def delete
    # id
  end
  
  def create
    # user_id, (collection_id or volume_id), text
  end
  
  def mark
    # id
  end
  
  def edit
    # id, text
  end
  
  def reply
    # comment_id, text
  end
  
end
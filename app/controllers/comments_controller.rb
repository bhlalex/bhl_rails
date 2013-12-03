class CommentsController < ApplicationController
 
  def delete
    # id
    if is_loggged_in?
      comment = Comment.find_by_id(:id => params[:id])
      comment.destroy if comment
    end
  end
  
  def create
    # user_id, (collection_id or volume_id), text
    if is_loggged_in?
      comment = Comment.create!(:collection_id => params[:collection_id], volume_id => params[:volume_id],
                                :user_id => session[:user_id], :text => params[:text]) 
      comment.save
    end
  end
  
  def mark
    # id
    comment = Comment.find_by_id(:id => params[:id])
    comment.mark = comment.mark + 1
    comment.save
  end
  
  def edit
    # id, text
    if is_loggged_in?
      comment = Comment.find_by_id(:id => params[:id])
      comment.text = params[:text]
      comment.save
    end
  end
  
  def reply
    # comment_id, text
    if is_loggged_in?
      comment = Comment.create!(:comment_id => params[:comment_id], :text => params[:text])
      comment.save
    end
  end
  
end
class CommentsController < ApplicationController
 
  def index
    # (collection_id or job_id), type = "collection, volume"
    if type == "collection"
      collection_id = params[:collection_id]
      comments_list = Comment.where(:collection_id => collection_id)
    else
      volume_id = Volume.find_by_job_id(params[:job_id]).id
      comments_list = Comment.where(:volume_id => volume_id)
    end
    @comments_replies_list = []
    comments_list.each do |comment|
      @comments_replies_list.push(comment)
      replies = Comment.where(:comment_id => comment.id)
      replies.each do |reply|
        @comments_replies_list.push(reply)
      end
    end
    @comments_replies_list
  end
  
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
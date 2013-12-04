class CommentsController < ApplicationController
  include BHL::Login
  
  def delete
    # id
    if is_loggged_in?
      comment = Comment.find_by_id( params[:id])
      comment.destroy if comment
    end
  end
  
  def create
    # user_id, (collection_id or volume_id), text
    if is_loggged_in?
      @comment = Comment.new(params[:comment])
      if (@comment.save)
        flash[:notice]=I18n.t(:comment_created)
        flash.keep
      else
        flash[:notice]=I18n.t(:comment_created_error)
        flash.keep
      end
      redirect_to :back
    end
  end
  
  def mark
    # id
    comment = Comment.find_by_id(params[:id])
    comment.number_of_marks = comment.number_of_marks + 1
    comment.save
    redirect_to :back
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
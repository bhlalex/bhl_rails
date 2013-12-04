class CommentsController < ApplicationController
  include BHL::Login
  
  def delete
    # id
    if is_loggged_in?
      comment = Comment.find_by_id( params[:id])
      replies = Comment.where(:comment_id => comment.id)
      if replies.count > 0
        flash[:error]=I18n.t(:can_not_delete_comment)
        flash.keep
      else
        comment.destroy if comment
        if comment.comment_id.nil?
          #comment
          flash[:notice]=I18n.t(:comment_deleted)
          flash.keep
        else
          #reply
          flash[:notice]=I18n.t(:reply_deleted)
          flash.keep
        end
      end
    end
    redirect_to :back
  end
  
  def create
    # user_id, (collection_id or volume_id), text
    if is_loggged_in?
      @comment = Comment.new(params[:comment])
      @comment.save
    end
    redirect_to :back
  end
  
  def mark
    # id
    comment = Comment.find_by_id(params[:id])
    comment.mark = comment.mark + 1
    comment.save
    flash[:notice]=I18n.t(:marked_as_abuse)
    flash.keep
    redirect_to :back
  end
  
  def reply
    # comment_id, text
    if is_loggged_in?
      comment = Comment.create!(:comment_id => params[:comment_id], :text => params[:text])
      comment.save
    end
    redirect_to :back
  end
  
end
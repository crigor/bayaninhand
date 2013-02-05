class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    comment = Comment.new(params[:comment])
    comment.commentable_type = "Event"
    comment.user = current_user
    logger.info comment.inspect
    if comment.save
      render :partial => "comments/comment", :locals => { :comment => comment }, :layout => false
    else
      render :js => "alert('There was an error saving your comment');"
    end
  end
end

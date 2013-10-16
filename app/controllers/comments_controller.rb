class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])

    type = params[:comment][:commentable_type]

    @comment.save

    if @comment.persisted? && request.xhr?
      render partial: "comments/show", locals: {comment: @comment, user: current_user, type: type}
    else
      redirect_to user_url(current_user)
    end
  end

end

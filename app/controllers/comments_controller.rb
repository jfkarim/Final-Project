class CommentsController < ApplicationController

  def create
    params[:comment][:user_id] = current_user.id
    @comment = Comment.new(params[:comment])
    type = params[:comment][:commentable_type]

    @comment.save

    if @comment.persisted? && request.xhr?
      render partial: "comments/show", locals: {comment: @comment, type: type}
    else
      redirect_to user_url(current_user)
    end
  end

end

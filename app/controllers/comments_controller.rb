class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])

    type = params[:comment][:commentable_type]
    owner_class = params[:owner_class]

    if owner_class == "User"
      @owner = User.find(params[:receiver_id])
    elsif owner_class == "Event"
      @owner = Event.find(params[:receiver_id])
    elsif owner_class == "Group"
      @owner = Group.find(params[:receiver_id])
    end

    @comment.save

    if @comment.persisted? && request.xhr?
      render partial: "comments/show", locals: {comment: @comment, owner: @owner, type: type}
    else
      redirect_to user_url(current_user)
    end
  end

end

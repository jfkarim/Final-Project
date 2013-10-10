class CommentsController < ApplicationController

  def create
    #FIX ALL COMMENT FORMS AND THIS CONTROLLER. ALL TO UGLY, INEFFICIENT AND NOT DRY

    @comment = Comment.new(params[:comment])

    type = params[:comment][:commentable_type]
    if @comment.save
      if type == "Post"
        redirect_to user_url(User.find(params[:receiver_id]))
      elsif type == "Photo"
        redirect_to user_photo_url(User.find(params[:owner_id]), Photo.find(params[:receiver_id]))
      else
        redirect_to user_photo_url(User.find(params[:owner_id]), Album.find(params[:receiver_id]))
      end
    end
  end

end

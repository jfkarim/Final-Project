class LikesController < ApplicationController

  def create
    @like = Like.new(params[:like])
    #MUST CLEAN THIS UP / COMPLETE MESS
    type = params[:like][:likeable_type]

    if @like.save
      if type == "Comment"
        sub_type = Comment.find(params[:like][:likeable_id]).commentable_type.to_s
        if sub_type == "Post"
          redirect_to user_url(User.find(params[:owner_id]))
        elsif sub_type == "Photo"
          redirect_to user_photo_url(User.find(params[:owner_id]), Photo.find(params[:receiver_id]))
        else
          redirect_to user_album_url(User.find(params[:owner_id]), Album.find(params[:receiver_id]))
        end
      elsif type == "Post"
        redirect_to user_url(User.find(params[:owner_id]))
      else
        redirect_to user_photo_url(User.find(params[:owner_id]), Photo.find(params[:receiver_id]))
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    render json: @like
  end

end

class LikesController < ApplicationController

  def create
    params[:like][:user_id] = current_user.id
    @like = Like.new(params[:like])
    type = params[:like][:likeable_type]

    if type == "Comment"
      type = Comment.find(@like.likeable_id)
    elsif type == "Post"
      type = Post.find(@like.likeable_id)
    elsif type == "Photo"
      type = Photo.find(@like.likeable_id)
    elsif type == "Album"
      type = Album.find(@like.likeable_id)
    else
      render text: "problem" #ERROR HANDLING NEEDED
    end

    if @like.save
      render partial: "likes/unlike", locals: {like: @like, type: type}
    else
      render text: "problem" #ERROR HANDLING NEEDED
    end
  end

  def destroy
    @like = Like.find(params[:id])
    type = @like.likeable_type

    @like.destroy

    if type == "Comment"
      type = Comment.find(@like.likeable_id)
      sub_type = type.commentable_type.to_s
      if sub_type == "Post"
        sub_type = Post.find(type.commentable_id)
        render partial: "likes/form", locals: {type: type, sub_type: sub_type}
      elsif sub_type == "Photo"
        sub_type = Post.find(type.commentable_id)
        render partial: "likes/form", locals: {type: type, sub_type: sub_type}
      elsif sub_type == "Album"
        sub_type = Album.find(type.commentable_id)
        render partial: "likes/form", locals: {type: type, sub_type: sub_type}
      else
        render text: "problem" #ERROR HANDLING NEEDED
      end
    elsif type == "Post"
      type = Post.find(@like.likeable_id)
      render partial: "likes/form", locals: {type: type}
    elsif type == "Photo"
      type = Photo.find(@like.likeable_id)
      render partial: "likes/form", locals: {type: type}
    elsif type == "Album"
      type = Album.find(@like.likeable_id)
      render partial: "likes/form", locals: {type: type}
    else
      render text: "problem" #ERROR HANDLING NEEDED
    end
  end

end

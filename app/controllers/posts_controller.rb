class PostsController < ApplicationController

  def new
    @post = Post.new
    render :new
  end

  def create
    params[:post][:user_id] = current_user.id
    @post = Post.new(params[:post])

    @post.save

    if @post.persisted? && request.xhr?
      render partial: "posts/show", locals: {post: @post}
    else
      redirect_to user_url(@user)  #ERROR HANDLING NEEDED
    end
  end

end

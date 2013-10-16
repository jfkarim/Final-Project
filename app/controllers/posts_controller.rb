class PostsController < ApplicationController

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(params[:post])
    @user = User.find(params[:receiver_id])

    @post.save

    if @post.persisted? && request.xhr?
      render partial: "users/post_show", locals: {post: @post, user: current_user}
    else
      redirect_to user_url(@user)
    end
  end

  def destroy
    # @post = Post.find(params[:id])
    # @post.destroy
    # redirect_to
  end

end

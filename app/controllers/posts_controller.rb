class PostsController < ApplicationController

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(params[:post])

    owner_class = params[:receiver_class]

    if owner_class == "User"
      @owner = User.find(params[:receiver_id])
    elsif owner_class == "Event"
      @owner = Event.find(params[:receiver_id])
    elsif owner_class == "Group"
      @owner = Group.find(params[:receiver_id])
    end

    @post.save

    if @post.persisted? && request.xhr?
      render partial: "posts/show", locals: {post: @post, owner: @owner}
    else
      redirect_to user_url(@user)  #ERROR HANDLING NEEDED
    end
  end

end

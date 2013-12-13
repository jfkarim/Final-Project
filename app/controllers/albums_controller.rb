class AlbumsController < ApplicationController

  def index
    @user = User.includes(:albums).find(params[:user_id])
    @albums = Album.where(user_id: params[:user_id])
    render :index
  end

  def new
    @user = User.find(params[:user_id])
    @album = Album.new
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    params[:album][:user_id] = params[:user_id]
    @album = Album.new(params[:album])

    if @album.save
      redirect_to edit_user_album_url(@user, @album)
    else
      render :new
    end
  end

  def edit
    @user = User.includes(:albums).find(params[:user_id])
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @user = User.includes(:albums).find(params[:user_id])
    @album = Album.find(params[:id])

    @album.update_attributes(params[:album])

    if request.xhr?
      render partial: "albums/edit_album_info", locals: {user: @user, album: @album}
    else
      redirect_to user_album_url(@user, @album)
    end

  end

  def show
    @user = User.includes(:albums).find(params[:user_id])
    @album = Album.find(params[:id])
    render :show
  end

  def destroy
    @user = User.includes(:albums).find(params[:user_id])
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to user_url(@user)
  end

end

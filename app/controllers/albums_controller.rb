class AlbumsController < ApplicationController

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
    @user = User.find(params[:user_id])
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:user_id])
    @album = Album.find(params[:id])

    if @album.update_attributes(params[:album])
      redirect_to user_album_url(@user, @album)
    else
      redirect_to edit_user_album_url(@user, @album)
    end
  end

  def show
    @user = User.find(params[:user_id])
    @album = Album.find(params[:id])
    render :show
  end

  def destroy
    @user = User.find(params[:user_id])
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to user_url(@user)
  end

end

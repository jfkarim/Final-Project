class PhotosController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @photos = Photo.where(user_id: params[:user_id])
    render :index
  end

  def create
    @user = User.find(params[:user_id])
    params[:photo][:user_id] = params[:user_id]
    @photo = Photo.new(params[:photo])

    @photo.save

    if @photo.album_id.nil?
      redirect_to edit_user_photo_url(@user, @photo)
    else
      redirect_to edit_user_album_url(@user, Album.find(@photo.album_id))
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(params[:photo])
      redirect_to user_photo_url(@user, @photo)
    end
  end

  def show
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
    render :show
  end

  def destroy
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to user_url(@user)
  end


end

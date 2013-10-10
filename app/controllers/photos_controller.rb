class PhotosController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    params[:photo][:user_id] = params[:user_id]
    @photo = Photo.new(params[:photo])

    if @photo.save
      if @photo.album_id.nil?
        redirect_to edit_user_photo_url(@user, @photo)
      else
        redirect_to edit_user_album_url(@user, Album.find(@photo.album_id))
      end
    else
      redirect_to user_url(@user)
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

    if @user.update_attributes(params[:photo])
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

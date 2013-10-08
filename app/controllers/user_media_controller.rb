class UserMediaController < ApplicationController

  def create
    @medium = Medium.find_by_name(params[:medium_name])

    if @medium
      medium_id = @medium.id
    else
      @medium = Medium.create({name: params[:medium_name]})
      medium_id = @medium.id
    end

    @user_medium = UserMedium.new({medium_id: medium_id, user_id: current_user.id})

    if @user_medium.save
      render json: @user_medium
    else
      render json: @user_medium
    end
  end

  def destroy
    @user_medium = UserMedium.find_by_user_id_and_medium_id(current_user.id, params[:medium_id])
    @user_medium.destroy
    render json: @user_medium
  end

end

class UserLocationsController < ApplicationController
  def create
    @location = Location.find_by_city(params[:location_city])

    if @location
      location_id = @location.id
    else
      @location = Location.create({city: params[:location_city]})
      location_id = @location.id
    end

    @user_location = UserLocation.new({location_id: location_id, user_id: current_user.id})

    if @user_location.save
      render json: @user_location
    else
      render json: @user_location
    end
  end

  def destroy
    @user_location = UserLocation.find_by_user_id_and_location_id(current_user.id, params[:location_id])
    @user_location.destroy
    render json: @user_location
  end

end

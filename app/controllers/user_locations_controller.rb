class UserLocationsController < ApplicationController
  def create
    @location = Location.find_by_city_and_country(params[:location][:city], params[:location][:country])

    if @location
      location_id = @location.id
    else
      @location = Location.create(params[:location])
      location_id = @location.id
    end

    @user_location = UserLocation.new(location_id: location_id, user_id: current_user.id)

    if @user_location.save
      redirect_to edit_user_url(current_user)
    else
      redirect_to edit_user_url(current_user)
    end
  end

  def destroy
    @user_location = UserLocation.find(params[:id])
    @user_location.destroy
    redirect_to edit_user_url(current_user)
  end

end

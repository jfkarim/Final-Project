class LocationsController < ApplicationController
  def index
    @locations = Location.where(user_id: current_user.id)
    render json: @locations
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      render json: @location
    else
      render json: @location
    end
  end
end

class MediaController < ApplicationController
  def index
    @media = Medium.where(user_id: current_user.id)
    render json: @media
  end

  def create
    @medium = Medium.new(params[:medium])
    if @medium.save
      render json: @medium
    else
      render json: @medium
    end
  end
end

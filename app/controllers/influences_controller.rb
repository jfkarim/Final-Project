class InfluencesController < ApplicationController
  def index
    @influences = Influence.where(user_id: current_user.id)
    render json: @influences
  end

  def create
    @influence = Influence.new(params[:influence])
    if @influence.save
      render json: @influence
    else
      render json: @influence
    end
  end
end

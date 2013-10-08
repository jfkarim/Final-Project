class UserInfluencesController < ApplicationController

  def create
    @influence = Influence.find_by_name(params[:influence_name])

    if @influence
      influence_id = @influence.id
    else
      @influence = Influence.create({name: params[:influence_name]})
      influence_id = @influence.id
    end

    @user_influence = UserInfluence.new({influence_id: influence_id, user_id: current_user.id})

    if @user_influence.save
      render json: @user_influence
    else
      render json: @user_influence
    end
  end


  def destroy
    @user_influence = UserInfluence.find_by_user_id_and_influence_id(current_user.id, params[:influence_id])
    @user_influence.destroy
    render json: @user_influence
  end

end

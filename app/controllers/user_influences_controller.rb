class UserInfluencesController < ApplicationController

  def create
    @influence = Influence.find_by_name(params[:influence][:name])

    if @influence
      influence_id = @influence.id
    else
      @influence = Influence.create(params[:influence])
      influence_id = @influence.id
    end

    @user_influence = UserInfluence.new(influence_id: influence_id, user_id: current_user.id)

    @user_influence.save

    if @user_influence.persisted? && request.xhr?
      render partial: "user_influences/ui", locals: {influence: @influence, user: current_user}
    else
      redirect_to edit_user_url(current_user)
    end
  end


  def destroy
    @user_influence = UserInfluence.find(params[:id])
    @user_influence.destroy
    redirect_to edit_user_url(current_user)
  end

end

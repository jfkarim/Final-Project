class GroupUsersController < ApplicationController

  def create
    @group_user = GroupUSer.new(user_id: params[:user_id], group_id: params[:id])

    if @group_user.save
      render json: @group_user
    else
      render json: @group_user
    end
  end

  def destroy
    @group_user = GroupUser.find(params[:id])
    @group_user.destroy
    render json: @group_user
  end

end

class GroupUsersController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    @users = User.all
    render :new
  end

  def create
    @group = Group.find(params[:group_id])
    @group_user = GroupUser.new(
      user_id: params[:user_id],
      group_id: params[:group_id],
      status: "PENDING")

    if @group_user.save
      render json: @group_user
    else
      redirect_to new_group_group_user_url(@group)
    end
  end

  def update
    @group = Group.find(params[:group_id])
    @group_user = GroupUser.find(params[:id])
    @group_user.approve!
    render json: @group_user
  end

  def destroy
    @group_user = GroupUser.find(params[:id])
    @group_user.destroy
    render json: @group_user
  end

end

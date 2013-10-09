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
      redirect_to new_group_group_user_url(@group)
    else
      redirect_to new_group_group_user_url(@group)
    end
  end

  def update
    @group = Group.find(params[:group_id])
    @group_user = GroupUser.find(params[:id])
    @group_user.approve!
    redirect_to group_url(@group)
  end


  def destroy
    @group = Group.find(params[:group_id])
    @group_user = GroupUser.find(params[:id])
    @group_user.destroy
    redirect_to edit_group_url(@group)
  end

end

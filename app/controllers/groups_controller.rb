class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    render :new
  end

  def create
    params[:group][:admin_id] = current_user.id
    @group = Group.new(params[:group])

    if @group.save
      GroupUser.create(group_id: @group.id, user_id: current_user.id, status: "APPROVED")
      Wall.create(wallable_type: "Group", wallable_id: @group.id)
      redirect_to group_url(@group)
    else
      render :new
    end
  end

  def edit
    @group = Group.includes(:users).find(params[:id])
    render :edit
  end

  def update
    @group = Group.find(params[:id])

    if @group.update_attributes(params[:group])
      redirect_to group_url(@group)
    else
      render :edit
    end
  end

  def show
    @group = Group.includes(:users).find(params[:id])
    render :show
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to user_url(current_user)
  end

end

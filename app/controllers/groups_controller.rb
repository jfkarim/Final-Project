class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    render :new
  end

  def create
    @group = Group.new(params[:group])

    if @group.save
      redirect_to group_url(@group)
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
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

end

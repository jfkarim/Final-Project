class UsersController < ApplicationController
  before_filter :require_current_user!, :only => [:show]
  before_filter :require_no_current_user!, :only => [:create, :new]

  def index
    @users = User.includes(:photos).all
    @photos = []

    @users.each do |user|
      @photos += user.photos
    end

    render :index
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      Wall.create(wallable_type: "User", wallable_id: @user.id)
      self.current_user = @user
      redirect_to user_url(@user)
    else
      render json: @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def show
    if params.include?(:id)
      @user = User.includes(:locations, :influences, :media, :themes).find(params[:id])
      render :show
    else
      redirect_to user_url(current_user)
    end
  end

  def edit
    @user = User.includes(:locations, :influences, :media, :themes).find(params[:id])
    render :edit
  end

  def update
    @user = User.includes(:locations, :influences, :media, :themes).find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to edit_user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

end

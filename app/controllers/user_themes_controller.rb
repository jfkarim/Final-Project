class UserThemesController < ApplicationController

  def create
    @theme = Theme.find_by_name(params[:theme_name])

    if @theme
      theme_id = @theme.id
    else
      @theme = Theme.create({name: params[:theme_name]})
      theme_id = @theme.id
    end

    @user_theme = UserTheme.new({theme_id: theme_id, user_id: current_user.id})

    if @user_theme.save
      render json: @user_theme
    else
      render json: @user_theme
    end
  end

  def destroy
    @user_influence = UserTheme.find_by_user_id_and_theme_id(current_user.id, params[:theme_id])
    @user_theme.destroy
    render json: @user_theme
  end

end

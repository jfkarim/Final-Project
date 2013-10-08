class ThemesController < ApplicationController
  def index
    @themes = Theme.where(user_id: current_user.id)
    render json: @themes
  end

  def create
    @theme = Theme.new(params[:theme])
    if @theme.save
      render json: @theme
    else
      render json: @theme
    end
  end
end

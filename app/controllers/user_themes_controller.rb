class UserThemesController < ApplicationController

  def create
    @theme = Theme.find_by_name(params[:theme][:name])

    if @theme
      theme_id = @theme.id
    else
      @theme = Theme.create(params[:theme])
      theme_id = @theme.id
    end

    @user_theme = UserTheme.new(theme_id: theme_id, user_id: current_user.id)

    @user_theme.save

    if @user_theme.persisted? && request.xhr?
      render partial: "user_themes/ut", locals: {theme: @theme, user: current_user}
    else
      redirect_to edit_user_url(current_user)
    end
  end

  def destroy
    @user_theme = UserTheme.find(params[:id])
    @user_theme.destroy
    redirect_to edit_user_url(current_user)
  end

end

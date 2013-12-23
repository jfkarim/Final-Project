class SessionsController < ApplicationController
  before_filter :require_no_current_user!, only: [:create, :new]
  before_filter :require_current_user!, only: [:destroy]

  def new
    user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      flash[:notice] = "Log in successful!"
      self.current_user = user
      redirect_to user_url(user)
    else
      flash[:notice] = "Wrong Credentials"
      user = User.new(email: params[:user][:email])
      render :new
    end
        
  end

  def destroy
    logout_current_user!
    flash[:notice] = "Sign out successful!"
    redirect_to new_session_url
  end

end

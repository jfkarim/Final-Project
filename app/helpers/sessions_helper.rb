module SessionsHelper
  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def current_user=(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def logout_current_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_current_user!
    redirect_to new_session_url if current_user.nil?
  end

  def require_no_current_user!
    redirect_to user_url(current_user) unless current_user.nil?
  end

  def can_post_on_wall?(user)
    current_user != user && user.friends.include?(current_user)
  end

  def is_page_owner?(user)
    current_user == user
  end

  def can_see_info?(user)
    current_user == @user || @user.approved_friends.include?(current_user)
  end
end

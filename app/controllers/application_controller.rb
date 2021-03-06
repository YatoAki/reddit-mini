class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    return !current_user.nil?
  end

  def require_user_login
    redirect_to new_session_url, status: :see_other unless logged_in?
  end

  def current_user
    return nil unless session[:session_token]
    @current_user = User.find_by_session_token(session[:session_token])
  end
end

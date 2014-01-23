class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # The ApplicationController deals with all of our other
  # controllers like a boss

  # Let's make a shortcut called current_user
  def current_user
    if session[:user_id].present?
      User.find(session[:user_id])
    end
  end

  # Make the shortcut above available in our views
  # as well as our controllers
  helper_method :current_user

end

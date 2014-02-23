class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user_name
    current_user.name if current_user
  end

  def current_user
    @current_user ||= User.where(name: session[:user_name]).first
  end
end

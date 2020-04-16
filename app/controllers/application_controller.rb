class ApplicationController < ActionController::Base
  # before_action :current_user
  # skip_before_action :authorize, only: [:new, :create]
  helper_method :current_user, :authorize

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      # flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
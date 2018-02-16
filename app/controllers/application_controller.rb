class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found

  before_action :authenticate_user!
  before_action :set_cookies_path
  helper_method :current_user,
                :logged_in?,


  def rescue_not_found
    render plain: 'error 404 not found'
  end

  private

  def set_cookies_path
    cookies[:path] = root_path
  end

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_out
    session[:user_id] = nil
  end

  def logged_in?
    current_user.present?
  end
end

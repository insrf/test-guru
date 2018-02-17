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
    if session[:user_id] == nil
      cookies[:path] = root_path
    end
  end

  def authenticate_user!
    unless current_user
      flash[:alert] = 'Are you a Guru? Verify your Email and Password please'
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end

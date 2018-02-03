class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found

  def rescue_not_found
    render plain: 'error 404 not found'
  end
end

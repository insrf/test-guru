class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    flash[:notice] = "Hey, #{current_user.first_name}"
    if current_user.is_a?(Admin)
      admin_tests_path
    else
      root_path
    end
  end

end

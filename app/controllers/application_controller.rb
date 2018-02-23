class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
  before_action :authenticate_user!
  before_action :set_locale

  def after_sign_in_path_for(user)
    flash[:notice] = "Hey, #{current_user.first_name}"
    if current_user.admin?
      admin_tests_path
    else
      root_path
    end
  end

  private

  def set_locale
    if I18n.locale_available?(params[:lang])
      I18n.locale = params[:lang]
      session[:locale] = I18n.locale
    elsif I18n.locale_available?(session[:locale])
      I18n.locale = session[:locale]
    else
      I18n.locale = I18n.default_locale
    end
  end
end

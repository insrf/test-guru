class FeedbacksController < ApplicationController

  before_action :save_back_path_session, only: %i[show]

  def show

  end

  def create
    first_name = params[:first_name]
    email = params[:email]
    content = params[:content]
    @feedback_params = [first_name, email, content]
    FeedbackMailer.feedback_send(@feedback_params).deliver_now

    redirect_to session.delete(:return_to)
  end

  private
  
  def save_back_path_session
    session[:return_to] ||= request.referer
  end

end

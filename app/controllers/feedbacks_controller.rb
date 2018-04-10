class FeedbacksController < ApplicationController

  before_action :save_back_path_session, only: %i[show]

  def show

  end

  def create
    FeedbackMailer.feedback_send(params[:first_name], params[:email], params[:content]).deliver_now

    redirect_to session.delete(:return_to)
  end

  private

  def save_back_path_session
    session[:return_to] ||= request.referer
  end

end

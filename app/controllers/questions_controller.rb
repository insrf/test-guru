class QuestionsController < ApplicationController
  #before_action :find_test, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: Question.where(test_id: params[:test_id]).pluck('body').join("\n")
  end

  def show
    render plain: Question.find(params[:id]).body
  end

  def new
  end

  def create
    question = Question.create(question_params)
    render plain: question.inspect
  end

  def destroy
    Question.destroy(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:id]).body
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end

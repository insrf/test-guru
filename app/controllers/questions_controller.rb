class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]

  def index
    render plain: @test.questions.pluck(:body).join("\n")
    #render plain: Question.where(test_id: params[:test_id]).pluck('body').join("\n")
  end

  def show
    render plain: Question.find(params[:id]).body
  end

  def new
  end

  def create
    question = Question.create(body: question_params[:body], test_id: params[:test_id])
    render plain: question.inspect
  end

  def destroy
    Question.destroy(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

end

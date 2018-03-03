class TestPassagesController < ApplicationController

  before_action :set_test_passage , only: %i[show result update gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    current_user.gists.create(question_id: @test_passage.current_question.id, url: result.url)

    flash_options = if result.public?
      { notice: "#{t('.success')}  #{result.html_url}"}

    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def add_gist_db

  end


  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

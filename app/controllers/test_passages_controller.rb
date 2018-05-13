class TestPassagesController < ApplicationController

  before_action :set_test_passage , only: %i[show result update gist]
  after_action :set_math_badge, :set_history_badge,
                :set_level_easy_badge, :set_level_elementary_badge,
                :set_level_advanced_badge, :set_level_hard_badge,
                :set_first_test_complited_test_badge, only: %i[result]

  def show
  end

  def result
  end

  def update
      if @test_passage.timeout.nil? || @test_passage.timeout > 0
        @test_passage.accept!(params[:answer_ids])
      end

      if @test_passage.completed?
        TestsMailer.completed_test(@test_passage).deliver_now
        redirect_to result_test_passage_path
      else
        render :show
      end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    current_user.gists.create(question_id: @test_passage.current_question.id,
                              url: result.url,
                              created_correct: result.created_at?)

    flash_options = if result.created_at?
      { notice: "#{t('.success')}  #{result.html_url}"}
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_math_badge
    if TestPassage.all_some_category_test_passed(current_user, "mathematics")
      add_user_bage("1")
    end
  end

  def set_history_badge
    if TestPassage.all_some_category_test_passed(current_user, "history")
      add_user_bage("2")
    end
  end

  def set_first_test_complited_test_badge
    if TestPassage.first_test_complited_test_badge?(current_user.id, @test_passage.test_id)
      add_user_bage("3")
    end
  end

  def set_level_easy_badge
    if TestPassage.all_some_level_test_passed(current_user, "0")
      add_user_bage("4")
    end
  end

  def set_level_elementary_badge
    if TestPassage.all_some_level_test_passed(current_user, "1")
      add_user_bage("5")
    end
  end

  def set_level_advanced_badge
    if TestPassage.all_some_level_test_passed(current_user, "2")
      add_user_bage("6")
    end
  end

  def set_level_hard_badge
    if TestPassage.all_some_level_test_passed(current_user, "3")
      add_user_bage("7")
    end
  end

  def add_user_bage(number_rule)
    @user_bages = UserBage.new(user_id: current_user.id, bage_id: Bage.where(rule: number_rule).ids[0])
    @user_bages.save
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

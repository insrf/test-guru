class AssignRuleBage
  def initialize(current_user, test_passage)
    @current_user = current_user
    @test_passage = test_passage
  end

  def call
    set_math_badge
    set_history_badge
    set_level_easy_badge
    set_level_elementary_badge
    set_level_advanced_badge
    set_level_hard_badge
    set_first_test_complited_test_badge
  end

  def set_math_badge
    if all_some_category_test_passed("mathematics")
      add_user_bage("all math tests passed")
    end
  end

  def set_history_badge
    if all_some_category_test_passed("history")
      add_user_bage("all history tests passed")
    end
  end

  def set_first_test_complited_test_badge
    if first_test_complited_test_badge?
      add_user_bage("successful passing of the test on the first attempt")
    end
  end

  def first_test_complited_test_badge?
    TestPassage.where(user_id: @current_user.id, test_id: @test_passage.test_id).first.success?
  end

  def set_level_easy_badge
    if all_some_level_test_passed("0")
      add_user_bage("successful passing all the tests of the easy level")
    end
  end

  def set_level_elementary_badge
    if all_some_level_test_passed("1")
      add_user_bage("successful passing all the tests of the elementary level")
    end
  end

  def set_level_advanced_badge
    if all_some_level_test_passed("2")
      add_user_bage("successful passing all the tests of the advanced level")
    end
  end

  def set_level_hard_badge
    if all_some_level_test_passed("3")
      add_user_bage("successful passing all the tests of the hard level")
    end
  end


  def all_some_category_test_passed(category)
    @correct_tests_id = []

    @current_user.test_passages.joins(:test => :category).where("categories.title" => category).each do |math|
      if math.success?
        @correct_tests_id << math.test_id
      end
    end

    if (Test.joins(:category).where("categories.title" => category).ids - @correct_tests_id).empty?
      true
    else
      false
    end
  end



  def all_some_level_test_passed(level)
    @correct_tests_id = []

    @current_user.test_passages.joins(:test).where("tests.level" => level).each do |math|
      if math.success?
        @correct_tests_id << math.test_id
      end
    end

    if (Test.where(level: level).ids - @correct_tests_id).empty?
      true
    else
      false
    end
  end

  def add_user_bage(number_rule)
    bage = Bage.where(rule: number_rule)
    @current_user.bages.push(bage)
  end

end

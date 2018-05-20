class AssignRuleBage
  def initialize(test_passage)
    @current_user = test_passage.user
    @test_passage = test_passage
  end

  def call
    Bage.find_each do |badge|
      add_badge!(badge) if send("#{badge.rule}_achieved?", rule_value = badge.rule_value)
    end
  end

  private

  def all_some_category_tests_passed_achieved?(rule_value)
    @correct_tests_id = []

    @current_user.test_passages.joins(:test => :category).where("categories.title" => rule_value).each do |math|
      if math.success?
        @correct_tests_id << math.test_id
      end
    end

    if (Test.joins(:category).where("categories.title" => rule_value).ids - @correct_tests_id).empty?
      true
    else
      false
    end

  end

  def successful_passing_all_the_tests_of_some_level_achieved?(rule_value)

    @correct_tests_id = []

    @current_user.test_passages.joins(:test).where("tests.level" => rule_value).each do |math|
      if math.success?
        @correct_tests_id << math.test_id
      end
    end

    if (Test.where(level: rule_value).ids - @correct_tests_id).empty?
      true
    else
      false
    end
  end

  def successful_passing_of_the_test_on_the_first_attempt_achieved?(rule_value)
    TestPassage.where(user_id: @current_user.id, test_id: @test_passage.test_id).first.success?
  end

  def add_badge!(badge)
    @current_user.bages.push(badge)
  end
end

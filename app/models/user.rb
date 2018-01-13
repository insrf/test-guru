class User < ApplicationRecord
  def level_view(level)
    Test.select('tests.title').
    joins('JOIN passing_tests ON tests.id = passing_tests.test_id').
    joins('JOIN users ON passing_tests.name_id = users.id').
    where("tests.level = ? AND users.id = ?", level, self.name_id)
  end
end

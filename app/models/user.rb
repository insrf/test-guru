class User < ApplicationRecord
  has_many :passing_tests
  has_many :tests, through: :passing_tests
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  def level_view(level)
    Test.select('tests.title').
    joins('JOIN passing_tests ON tests.id = passing_tests.test_id').
    joins('JOIN users ON passing_tests.name_id = users.id').
    where("tests.level = ? AND passing_tests.name_id = ?", level, self.id)
  end
end

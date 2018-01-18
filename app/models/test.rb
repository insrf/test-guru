class Test < ApplicationRecord
  has_many :questions
  has_many :passing_tests
  has_many :users, through: :passing_tests
  belongs_to :category
  belongs_to :author, class_name: "User"
  
  def self.ordered_test_titles_by_cateogory(name_category)
    Test.select('tests.title').
    joins('JOIN categories ON tests.category_id = categories.id').
    where("categories.title = ?", name_category).
    order('tests.title DESC')
  end
end

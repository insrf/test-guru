class Test < ApplicationRecord
  def self.ordered_test_titles_by_cateogory(name_category)
    Test.select('tests.title').
    joins('JOIN categories ON tests.category_id = categories.id').
    where("categories.title = ?", name_category).
    order('tests.title DESC')
  end
end

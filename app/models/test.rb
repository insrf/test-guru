class Test < ApplicationRecord
  def self.sort(name_category)
    Test.select('tests.title').
    joins('JOIN categories ON tests.category_id = categories.id').
    where("categories.title = ?", name_category).
    order('tests.title DESC')
  end
end

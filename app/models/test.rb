class Test < ApplicationRecord
  has_many :questions
  has_many :passing_tests
  has_many :users, through: :passing_tests
  belongs_to :category
  belongs_to :author, class_name: "User"

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title && :level, uniqueness: true
 
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  
  def self.ordered_test_titles_by_category(name_category)
    Test.select('tests.title').
    joins('JOIN categories ON tests.category_id = categories.id').
    where("categories.title = ?", name_category).
    order('tests.title DESC')
  end
end

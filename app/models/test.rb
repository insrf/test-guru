class Test < ApplicationRecord
  has_many :questions
  has_many :passing_tests
  has_many :users, through: :passing_tests
  belongs_to :category
  belongs_to :author, class_name: "User"

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level }
 
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_level, -> (level) { where(level: level) }

  scope :by_category, -> (name_category) { joins(:category).
                                           where(categories: { title: name_category }) }

  def self.ordered_test_titles_by_category(name_category)
    self.by_category(name_category).order(title: :desc).pluck(:title)
  end
end

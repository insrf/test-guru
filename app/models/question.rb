class Question < ApplicationRecord
  has_many :test_passages
  has_many :current_questions, through: :test_passages
  has_many :answers
  belongs_to :test

  validates :body, presence: true
end

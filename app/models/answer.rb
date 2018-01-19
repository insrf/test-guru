class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_count_answers

  scope :correct?, -> { where(correct: true) }
end

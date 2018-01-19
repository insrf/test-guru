class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true

  private

  def validate_count_answers
    if self.answers.count >= 1 && self.answers.count <=4
      then errors.add(:body)
    end
  end
end

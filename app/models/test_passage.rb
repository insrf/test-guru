class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answers_ids)
    if correct_answer?(answers_ids)
      self.correct_questions += 1
    end
    self.current_question = next_question
    save!
  end

  def completed?
    self.current_question.nil?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answers_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answers_ids).count) &&
    (correct_answers_count == answers_ids.count)
  end

  def correct_answers
    self.current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end

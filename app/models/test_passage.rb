class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def accept!(answers_ids)
    if correct_answer?(answers_ids)
      self.correct_questions += 1
    end
    save!
  end

  def completed?
    self.current_question.nil?
  end

  def success?
    self.correct_questions / self.test.questions.count >= 0.85
  end

  def success_rate
    (((self.correct_questions).to_f / (self.test.questions.count).to_f) * 100).to_i
  end

  def progress
    (((self.index_current_question - 1).to_f / (self.test.questions.count).to_f) * 100).to_i
  end

  def index_current_question
    self.test.questions.pluck(:body).rindex(self.current_question.body) + 1
  end

  def timeout
    self.test.timer - (Time.now.to_i % 86400 - self.created_at.to_i % 86400)
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answers_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answers_ids).count) &&
    (correct_answers_count == answers_ids.count)
  end

  def correct_answers
    self.current_question.answers.correct
  end

end

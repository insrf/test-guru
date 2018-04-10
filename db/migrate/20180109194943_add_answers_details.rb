class AddAnswersDetails < ActiveRecord::Migration[5.1]
  def change
    change_column(:answers, :body, :text)
    change_column(:answers, :correct, :boolean)
    change_column_default(:answers, :correct, false)
    rename_column(:answers, :test_id, :question_id)
  end
end

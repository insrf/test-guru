class AddQuestionNullConstraint1 < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:questions, :body, false)
    change_column_null(:questions, :test_id, false)
  end
end

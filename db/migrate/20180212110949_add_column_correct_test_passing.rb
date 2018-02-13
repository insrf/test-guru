class AddColumnCorrectTestPassing < ActiveRecord::Migration[5.1]
  def change
    add_column :passing_tests, :current_question, :integer
    add_column :passing_tests, :correct_questions, :integer
    change_column_default :passing_tests, :correct_questions, 0
  end
end

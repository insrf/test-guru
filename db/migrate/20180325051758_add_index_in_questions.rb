class AddIndexInQuestions < ActiveRecord::Migration[5.1]
  def change
    add_index :questions, :test_id
  end
end

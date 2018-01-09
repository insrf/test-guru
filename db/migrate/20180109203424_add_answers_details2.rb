class AddAnswersDetails2 < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:answers, :correct, 0)
    change_column_null(:answers, :correct, true)
  end
end

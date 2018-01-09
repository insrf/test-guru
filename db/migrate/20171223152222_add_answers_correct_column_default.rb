class AddAnswersCorrectColumnDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:answers, :correct, 1)
  end
end

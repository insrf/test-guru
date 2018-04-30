class CorrectTimerInTestPassage < ActiveRecord::Migration[5.1]
  def change
    remove_column :tests, :timer_on
    remove_column :tests, :timer
    add_column :tests, :timer, :integer
  end
end

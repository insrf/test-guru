class AddCollumnTimerToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :timer_on, :boolean, default: false
    add_column :tests, :timer, :time
  end
end

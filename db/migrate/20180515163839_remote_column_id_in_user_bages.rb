class RemoteColumnIdInUserBages < ActiveRecord::Migration[5.1]
  def change
    remove_column :bages, :number_of_rule
  end
end

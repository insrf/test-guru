class AddCollumnInBadges < ActiveRecord::Migration[5.1]
  def change
    remove_column :bages, :rule
    add_column :bages, :rule, :text, array:true, default: []
  end
end

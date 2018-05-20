class AddCollumnRulesToBages < ActiveRecord::Migration[5.1]
  def change
    add_column :bages, :rule, :string
    add_column :bages, :number_of_rule, :integer
  end
end

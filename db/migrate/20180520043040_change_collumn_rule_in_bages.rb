class ChangeCollumnRuleInBages < ActiveRecord::Migration[5.1]
  def change
    remove_column :bages, :rule
    add_column :bages, :rule, :text
    add_column :bages, :rule_value, :text
  end
end

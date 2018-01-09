class RenameCategoryTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :categoties, :categories
  end
end

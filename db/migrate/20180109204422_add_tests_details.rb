class AddTestsDetails < ActiveRecord::Migration[5.1]
  def change
    rename_column(:tests, :categories_id, :category_id)
  end
end

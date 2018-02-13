class DropCollumnUniqueTestsVer2 < ActiveRecord::Migration[5.1]
  def change
    remove_column :tests, :index_tests_on_title_and_level
  end
end

class DropCollumnUniqueTestsVer3 < ActiveRecord::Migration[5.1]
  def up
    remove_column :tests, :index_tests_on_title_and_level
  end
end

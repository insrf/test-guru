class DropIndexUniqueTestsVer4 < ActiveRecord::Migration[5.1]
  def up
    remove_index :tests, [:title, :level]
  end
end

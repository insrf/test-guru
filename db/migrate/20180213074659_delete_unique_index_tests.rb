class DeleteUniqueIndexTests < ActiveRecord::Migration[5.1]
  def down
    remove_column :tests, [:title, :level]
  end
end

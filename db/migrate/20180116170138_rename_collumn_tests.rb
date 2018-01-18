class RenameCollumnTests < ActiveRecord::Migration[5.1]
  def change
    rename_column(:tests, :user_id, :author_id)
  end
end

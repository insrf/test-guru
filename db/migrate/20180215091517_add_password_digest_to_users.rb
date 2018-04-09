class AddPasswordDigestToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_digest, :string
    rename_column :users, :login
    remove_column :users, :password
  end
end

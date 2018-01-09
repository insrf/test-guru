class AddUsersDetails < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:users, :name, true)
    change_column_null(:users, :login, false)
    change_column_null(:users, :password, false)
  end
end

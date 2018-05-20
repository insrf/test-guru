class CreateUserBages < ActiveRecord::Migration[5.1]
  def change
    create_table :user_bages do |t|

      t.references :user, foreign_key: true
      t.references :bage, foreign_key: true

      t.timestamps
    end
  end
end

class CreateBages < ActiveRecord::Migration[5.1]
  def change
    create_table :bages do |t|

      t.string :name
      t.string :url

      t.timestamps
    end
  end
end

class CreateCategoties < ActiveRecord::Migration[5.1]
  def change
    create_table :categoties do |t|
      t.string :title

      t.timestamps
    end
  end
end

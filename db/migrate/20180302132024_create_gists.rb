class CreateGists < ActiveRecord::Migration[5.1]
  def change
    create_table :gists do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.text :url

      t.timestamps
    end
  end
end

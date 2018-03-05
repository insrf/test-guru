class AddColumnCreatedCorrectToGists < ActiveRecord::Migration[5.1]
  def change
    add_column :gists, :created_correct, :boolean, default: false
  end
end

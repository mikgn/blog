class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.integer :user_id, null: false
      t.string :title
      t.string :url

      t.timestamps
    end
    add_index :providers, :user_id
    add_foreign_key :providers, :users
  end
end

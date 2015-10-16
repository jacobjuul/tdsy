class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :country
      t.string :profile_text
      t.string :gender
      t.string :sales_manager
      t.string :sales_manager_email
      t.string :company
      t.string :position
      t.integer :telephone
      t.string :os
      t.string :communication

      t.timestamps null: false
    end
  end
end

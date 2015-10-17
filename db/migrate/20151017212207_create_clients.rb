class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :country
      t.string :phone
      t.string :sales_manager
      t.string :sales_manager_email

      t.timestamps null: false
    end
    add_index :clients, :email
    add_index :clients, :sales_manager_email
  end
end

class AddProfileTextToClients < ActiveRecord::Migration
  def change
    add_column :clients, :profile_text, :string
  end
end

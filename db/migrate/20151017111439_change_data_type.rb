class ChangeDataType < ActiveRecord::Migration
  def change
    change_column :users, :telephone, :text
  end
end

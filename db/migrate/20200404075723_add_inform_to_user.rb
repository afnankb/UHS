class AddInformToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Name, :string
    add_column :users, :City, :string
    add_column :users, :User_role, :string
    add_column :users, :Category, :string
    add_column :users, :Phone_Number, :integer
    add_column :users, :NA, :integer
  end
end

class ChangePhoneNumberToBeSerialInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :Phone_Number, :bigint
  end
end

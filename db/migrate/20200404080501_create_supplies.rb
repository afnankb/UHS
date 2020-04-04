class CreateSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :supplies do |t|
      t.references :user, foreign_key: true
      t.string :Name
      t.integer :Total
      t.integer :In_used
      t.integer :Averge_used
      t.integer :Availble

      t.timestamps
    end
  end
end

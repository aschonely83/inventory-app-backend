class CreatePallets < ActiveRecord::Migration[6.0]
  def change
    create_table :pallets do |t|
      t.string :boxes
      t.references :retailer, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end

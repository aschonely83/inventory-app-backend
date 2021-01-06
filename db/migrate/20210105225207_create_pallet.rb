class CreatePallet < ActiveRecord::Migration[6.0]
  def change
    create_table :pallet do |t|
      t.integer :retailer_id
      t.string :boxes
      t.references :retailer, null: false, foreign_key: true
      t.index ["retailer_id"], name: "index_pallets_on_retailer_id"

      t.timestamps
    end
  end
end

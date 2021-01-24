class AddActiveToRetailers < ActiveRecord::Migration[6.0]
  def change
    add_column :retailers, :active, :boolean
  end
end

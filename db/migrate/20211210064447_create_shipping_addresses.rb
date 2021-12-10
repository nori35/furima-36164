class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string  :postal_code , null: false
      t.integer :shipping_area_id
      t.string  :city
      t.string  :address
      t.string  :building_name
      t.string  :telephone
      :item_id, 
      :buy
      t.timestamps
    end
  end
end

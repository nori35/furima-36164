class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.references :user_id
      t.references :item_id
      t.timestamps
    end
  end
end

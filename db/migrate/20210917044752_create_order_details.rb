class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :product_id, null: false
      t.integer :order_id, null: false
      t.integer :quantity, null: false
      t.integer :production_status, null: false, default: false
      t.integer :purchased_price, null: false

      t.timestamps
    end
  end
end

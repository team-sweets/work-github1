class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :address_name, null: false
      t.string :shipping_address, null: false
      t.string :shipping_postal_code, null: false
      t.integer :orders_status, null: false, default: false
      t.integer :postage, null: false
      t.integer :total_price, null: false
      t.integer :payment_method, null: false, default: false

      t.timestamps
    end
  end
end

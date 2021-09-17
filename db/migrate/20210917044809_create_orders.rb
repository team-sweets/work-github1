class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :address_name
      t.string :shipping_address
      t.string :shipping_postal_code
      t.integer :orders_status
      t.integer :postage
      t.integer :total_price
      t.integer :payment_method

      t.timestamps
    end
  end
end

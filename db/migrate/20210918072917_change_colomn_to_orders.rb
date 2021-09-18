class ChangeColomnToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:orders, :customer_id, false)
    change_column_null(:orders, :address_name, false)
    change_column_null(:orders, :shipping_address, false)
    change_column_null(:orders, :shipping_postal_code, false)
    change_column_null(:orders, :orders_status, false)
    change_column_null(:orders, :postage, false)
    change_column_null(:orders, :total_price, false)
    change_column_null(:orders, :payment_method, false)
  end
end

class ChangeColomnToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:order_details, :product_id, false)
    change_column_null(:order_details, :order_id, false)
    change_column_null(:order_details, :quantity, false)
    change_column_null(:order_details, :production_status, false)
    change_column_null(:order_details, :purchased_price, false)
  end
end

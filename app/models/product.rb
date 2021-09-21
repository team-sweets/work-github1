class Product < ApplicationRecord
 attachment :image

 #enum sales_status: { on_sale: 0, sold_out: 1 }
 validates :sales_status, inclusion: { in: [true, false] }

 belongs_to :genre

 has_many :cart_items

 has_many :order_details

  def add_tax_tax_out_price
    (self.tax_out_price * 1.10).round
  end
end

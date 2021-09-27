class Product < ApplicationRecord
 attachment :image

 #enum sales_status: { on_sale: 0, sold_out: 1 }
 validates :image, presence: true
 validates :name, presence: true
	validates :description, presence: true
	validates :tax_out_price, presence: true

 validates :sales_status, inclusion: { in: [true, false] }

 validates :tax_out_price, numericality: { only_integer: true }

 belongs_to :genre

 has_many :cart_items

 has_many :order_details

  def add_tax_tax_out_price
    (self.tax_out_price * 1.10).round
  end
end

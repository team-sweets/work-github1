class Product < ApplicationRecord

  attachment :image

  enum sales_status: { on_sale: 0, sold_out: 1 }

end

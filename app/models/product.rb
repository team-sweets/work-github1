class Product < ApplicationRecord
<<<<<<< HEAD

  attachment :image

  enum sales_status: { on_sale: 0, sold_out: 1 }

=======
  belongs_to :genre
>>>>>>> origin/develop
end

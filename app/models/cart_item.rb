class CartItem < ApplicationRecord
   validates :quantity, presence: true


  belongs_to :product
  belongs_to :customer
end

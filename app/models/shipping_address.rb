class ShippingAddress < ApplicationRecord

  belongs_to :customer

  validates :customer_id, :postal_code, :address, :name,
            presence: true

  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
end

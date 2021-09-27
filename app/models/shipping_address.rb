class ShippingAddress < ApplicationRecord

  belongs_to :customer

  validates :customer_id, :postal_code, :address, :name,
            presence: true

  def view_name_and_id
    '〒' + ' ' + self.postal_code + ' ' + self.address + ' ' + self.name
  end

  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
end

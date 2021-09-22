class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer

  enum orders_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
  
  enum production_status:　{　製作不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }
  
  enum payment_method:  { クレジットカード: 0, 銀行振込: 1 }

end

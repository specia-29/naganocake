class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy #中間テーブル
  has_many :items, through: :order_details  #注文には商品が多くある
  belongs_to :customer

 enum status: {
     payment_waiting: 0, payment_check: 1, in_production: 2, preparing_delivery: 3, delivered: 4
 }

enum payment_method: { credit_card: 0, transfer: 1 }

end

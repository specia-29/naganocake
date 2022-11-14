class Item < ApplicationRecord
    belongs_to :genre
    has_one_attached :image
    has_many :orders, dependent: :destroy
    has_many :cart_items, dependent: :destroy

    def taxin_price
        price*1.1
    end
end

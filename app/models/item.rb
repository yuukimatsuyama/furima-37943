class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :delivary_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days
  

  with_options presence: true do
    validates :item_name
    validates :content
    validates :category_id
    validates :product_status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :shipping_days_id
    validates :price
    validates :image
  end
end

class Item < ApplicationRecord
<<<<<<< Updated upstream
  belongs_to :user
  has_one_attached :image
  has_one :buying_items
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days
  
  with_options presence: true do
    validates :item_name
    validates :content
    validates :image
    validates :price,inclusion: {in: 300..9_999_999},format:{with: /\A[0-9]+\z/},numericality:{only_integer:true}
    with_options numericality: { other_than: 0} do
      validates :category_id
      validates :product_status_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :shipping_days_id
    end
  end
end

=======
end
>>>>>>> Stashed changes

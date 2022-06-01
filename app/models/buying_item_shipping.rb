class BuyingItemShipping

include ActiveModel::Model
attr_accessor :user_id,:item_id,:address_number,:prefecture_id,:municipality,:address,:building_name,:phone_number,:buying_item_id

with_options presence: true do
  validates :address_number ,format: {with:/\A\d{3}[-]\d{4}\z/}
  validates :prefecture_id, numericality: { other_than: 0} 
  validates :municipality
  validates :address
  validates :phone_number ,format: {with:/\A\d{10,11}\z/}
  validates :user_id
  validates :item_id
end

  def save
    buying_item = BuyingItem.create(user_id: user_id,item_id: item_id)
    ShippingAddress.create(address_number: address_number,prefecture_id: prefecture_id,municipality: municipality,address: address,building_name: building_name,phone_number:phone_number,buying_item_id: buying_item.id)
  end
end
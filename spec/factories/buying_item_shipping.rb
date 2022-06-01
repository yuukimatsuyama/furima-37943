FactoryBot.define do
  factory :buying_item_shipping do
    address_number        {'000-0000'}
    prefecture_id         {1}
    municipality          {'テスト市'}
    building_name         {'テストアパート202'}
    address               {'5番10号'}
    phone_number          {'00011112222'}
  end
end

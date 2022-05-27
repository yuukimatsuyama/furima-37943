FactoryBot.define do
  factory :item do
    item_name               {'テスト'}
    content                 {'テスト'}
    category_id             {1}
    product_status_id       {2}
    delivery_charge_id      {1}
    prefecture_id           {2}
    shipping_days_id        {1}
    price                   {5000}
    image                   {'public/image/test_image.png'}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end

FactoryBot.define do
  factory :item do
    association :user
    name { 'タンブラー' }
    description { 'これはテストの商品です' }
    prefecture_id { 2 }
    price { 5000 }
    category_id  { 2 }
    condition_id { 2 }
    shipping_free_burden_id { 2 }
    shipping_day_id  { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

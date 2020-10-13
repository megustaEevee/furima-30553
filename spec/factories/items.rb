FactoryBot.define do
  factory :item do

    name { '出品' }
    info { '出品します' }
    category_id { 2 }
    sales_status_id { 2 }
    shipping_fee_status_id { 2 }
    prefecture_source_id { 2 }
    scheduled_delivery_id { 2 }
    price { 300 }

    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end

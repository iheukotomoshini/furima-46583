FactoryBot.define do
  factory :furima do
    title { Faker::Lorem.sentence }
    explanation { Faker::Lorem.paragraph }
    category_id { 2 }
    status_id { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id { 2 }
    scheduled_delivery_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |furima|
      furima.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end    
  end
end
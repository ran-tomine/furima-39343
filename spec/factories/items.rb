FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    association :user
    explanation { Faker::Lorem.sentence }
    category_id { 2 }
    situation_id { 2 }
    shipping_charge_id { 2 }
    region_of_origin_id { 2 }
    day_to_ship_id { 2 }
    price { Faker::Number.between(from: 300, to: 9_999_999).to_i }
    

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
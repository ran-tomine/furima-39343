FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    association :user
    explanation { Faker::Lorem.sentence }
    category_id { Category.all.sample }
    situation_id { Situation.all.sample }
    shipping_charge_id { ShippingCharge.all.sample }
    region_of_origin_id { RegionOfOrigin.all.sample }
    day_to_ship_id { DayToShip.all.sample }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    image { Rack::Test::UploadedFile.new('public/images/test_image.png', 'image/png') }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
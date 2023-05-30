FactoryBot.define do
  factory :order_form do
    
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    post_code  { '123-4567' }
    region_of_origin_id {2}
    municipality { '東京都' }
    address { '青山1-1-1' }
    building_name {'柳ビル103'}
    telephone_number { '00000000000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end

FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '山田' }
    first_katakana        { 'タロウ' }
    last_katakana         { 'ヤマダ' }
    date_of_birth         { Faker::Date.backward(days: 365 * 30) }
  end
end
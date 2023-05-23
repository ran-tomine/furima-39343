require 'faker'

# カタカナの名前を生成するメソッド
def generate_katakana_name
  Faker::Base.regexify(/[\p{Katakana}ー]{2,20}/)
end


FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Faker::Name.first_name}
    last_name             {Faker::Name.last_name}
    first_katakana        { generate_katakana_name }
    last_katakana         { generate_katakana_name } 
    date_of_birth         {Faker::Date.backward(days: 365 * 30)}
  end
end
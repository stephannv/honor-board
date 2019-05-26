FactoryBot.define do
  factory :participant do
    username { Faker::Internet.unique.username(separator: '_') }
    friend_code { "SW-#{Faker::Number.number(4)}-#{Faker::Number.number(4)}-#{Faker::Number.number(4)}" }
  end
end

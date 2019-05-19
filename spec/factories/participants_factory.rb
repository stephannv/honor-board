FactoryBot.define do
  factory :participant do
    username { Faker::Internet.unique.username(separator: '_') }
  end
end

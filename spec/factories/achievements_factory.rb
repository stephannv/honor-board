FactoryBot.define do
  factory :achievement do
    title { Faker::Lorem.unique.sentence }
    points { Faker::Number.between(1, 15) }
    achievement_type { Achievement.achievement_types.values.sample }
    order { Faker::Number.between(1, 20).to_s }
  end
end

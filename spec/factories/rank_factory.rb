FactoryBot.define do
  factory :rank do
    sequence(:rank) { |n| "Season #{n}" }
    participant_id { SecureRandom.uuid }
    participant_username { Faker::Internet.unique.username(separator: '_') }
    total_points { Faker::Number.between(1, 100) }
    participations_count { Faker::Number.between(1, 15) }
  end
end

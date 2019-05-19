FactoryBot.define do
  factory :season do
    sequence(:title) { |n| "Season #{n}" }
    started_at { Faker::Date.between(1.year.ago, Time.zone.today) }
  end
end

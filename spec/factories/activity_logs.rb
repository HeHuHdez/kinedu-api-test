# frozen_string_literal: true

FactoryBot.define do
  factory :activity_log do
    association :baby, factory: :baby, strategy: :create
    association :assistant, factory: :assistant, strategy: :create
    association :activity, factory: :activity, strategy: :create
    start_time { Time.zone.now }
    stop_time { Time.zone.now + 5.minutes }
    duration { nil }
    comments { Faker::Lorem.paragraph }
  end
end

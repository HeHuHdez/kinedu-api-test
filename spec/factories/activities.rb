# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
  end
end

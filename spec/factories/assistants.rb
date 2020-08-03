# frozen_string_literal: true

FactoryBot.define do
  factory :assistant do
    name { Faker::Name.name }
    group { rand(1..5).to_s }
    address { Faker::Address.full_address  }
    phone { Faker::PhoneNumber.cell_phone }
  end
end

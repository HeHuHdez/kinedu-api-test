# frozen_string_literal: true

FactoryBot.define do
  factory :baby do
    name { Faker::Name.name }
    birthday { Faker::Date.between(from: '2016-09-23', to: '2019-09-23') }
    mother_name { Faker::Name.name }
    father_name { Faker::Name.name }
    address { Faker::Address.full_address  }
    phone { Faker::PhoneNumber.cell_phone }
  end
end

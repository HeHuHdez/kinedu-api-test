# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password1234' }
    password_confirmation { 'password1234' }
    auth_token { nil }
    expires_at { nil }
  end
end

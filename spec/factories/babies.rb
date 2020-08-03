# frozen_string_literal: true

FactoryBot.define do
  factory :baby do
    name { 'MyString' }
    birthday { '2020-08-03' }
    mother_name { 'MyString' }
    father_name { 'MyString' }
    address { 'MyString' }
    phone { 'MyString' }
  end
end

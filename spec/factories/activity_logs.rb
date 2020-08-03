# frozen_string_literal: true

FactoryBot.define do
  factory :activity_log do
    baby { nil }
    assistant { nil }
    activity { nil }
    start_time { '2020-08-03 21:35:32' }
    stop_time { '2020-08-03 21:35:32' }
    duration { 1 }
    comments { 'MyString' }
  end
end

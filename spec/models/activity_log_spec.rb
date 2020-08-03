# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActivityLog, type: :model do
  subject(:activity_log) { build(:activity_log) }

  describe 'relations' do
    it { is_expected.to belong_to(:baby) }
    it { is_expected.to belong_to(:activity) }
    it { is_expected.to belong_to(:assistant) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:start_time) }

    context 'with start_time being after stop_time' do
      it 'fails with an error' do
        activity_log.stop_time = 3.years.ago
        activity_log.valid?
        expect(activity_log.errors.messages[:stop_time].size).to eq(1)
      end
    end

    context 'with start_time being before stop_time' do
      it 'is a valid record' do
        activity_log.stop_time = 3.years.from_now
        expect(activity_log.valid?).to eq(true)
      end
    end
  end
end

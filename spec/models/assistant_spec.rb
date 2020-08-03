# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Assistant, type: :model do
  subject(:assistant) { build(:assistant) }

  describe 'relations' do
    it { is_expected.to have_many(:activity_logs) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:group) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:phone) }
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity, type: :model do
  subject(:activity) { build(:activity) }

  describe 'relations' do
    it { is_expected.to have_many(:activity_logs) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end
end

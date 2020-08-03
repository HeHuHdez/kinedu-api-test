# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Baby, type: :model do
  subject(:baby) { build(:baby) }

  describe 'relations' do
    it { is_expected.to have_many(:activity_logs) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:birthday) }
    it { is_expected.to validate_presence_of(:mother_name) }
    it { is_expected.to validate_presence_of(:father_name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:phone) }
  end
end

# frozen_string_literal: true

# frozen_string_literal: true

# Baby class
class Baby < ApplicationRecord
  has_many :activity_logs, dependent: :nullify

  validates :name, :birthday, :mother_name, :father_name, :address, :phone, presence: true
end

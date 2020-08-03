# frozen_string_literal: true

# Assistant class
class Assistant < ApplicationRecord
  has_many :activity_logs, dependent: :nullify

  validates :name, :group, :address, :phone, presence: true
end

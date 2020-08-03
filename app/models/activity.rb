# frozen_string_literal: true

# Activity Class
class Activity < ApplicationRecord
  has_many :activity_logs, dependent: :nullify

  validates :name, :description, presence: true
end

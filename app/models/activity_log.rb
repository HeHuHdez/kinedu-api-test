# frozen_string_literal: true

# Log of activities from the babies
class ActivityLog < ApplicationRecord
  belongs_to :baby
  belongs_to :assistant
  belongs_to :activity

  validates :start_time, presence: true

  validate :ends_after_starts, if: proc { |a| a.start_time? && a.stop_time? }

  before_save :update_duration, if: :stop_time?

  private

  def update_duration
    self.duration = (stop_time - start_time) / 60
  end

  def ends_after_starts
    errors.add(:stop_time, message: "The stop_time field can't be before #{start_time}") if start_time >= stop_time
  end
end

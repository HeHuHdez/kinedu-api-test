# frozen_string_literal: true

# frozen_string_literal: true

# Baby class
class Baby < ApplicationRecord
  has_many :activity_logs, dependent: :nullify

  validates :name, :birthday, :mother_name, :father_name, :address, :phone, presence: true

  def filtered_activity_logs(page_offset)
    activity_logs
      .page(page_offset)
      .select('activity_logs.baby_id as baby_id, activity_logs.id as activity_log_id,
      assistants.name as teacher_name, activity_logs.start_time, activity_logs.stop_time')
      .joins(:assistant)
  end
end

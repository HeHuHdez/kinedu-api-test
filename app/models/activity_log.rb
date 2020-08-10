# frozen_string_literal: true

# Log of activities from the babies
class ActivityLog < ApplicationRecord
  belongs_to :baby
  belongs_to :assistant
  belongs_to :activity

  validates :start_time, presence: true

  validate :ends_after_starts, if: proc { |a| a.start_time? && a.stop_time? }

  before_save :update_duration, if: :stop_time?

  scope :from_baby, lambda { |baby_name|
                      where('babies.name = ?', baby_name) unless baby_name.blank?
                    }

  scope :from_assistant, lambda { |assistant|
                           where('assistants.name = ?', assistant) unless assistant.blank?
                         }

  scope :with_status, lambda { |status|
                          if status == "En Progreso"
                            where('activity_logs.stop_time IS NULL')
                          elsif status == "Terminado"
                            where('activity_logs.stop_time IS NOT NULL')
                          end
                      }

  def self.paginated_select(page)
    page(page)
      .select('babies.name as baby_name, assistants.name as assistant_name, activities.name as activity_name,
      start_time, IF(stop_time, "Terminado", "En Progreso") as status, duration')
      .joins(:baby, :assistant, :activity)
      .order(start_time: :desc)
  end

  private

  def update_duration
    self.duration = (stop_time - start_time) / 60
  end

  def ends_after_starts
    errors.add(:stop_time, message: "The stop_time field can't be before #{start_time}") if start_time >= stop_time
  end
end

# frozen_string_literal: true

class BabyLogSerializer < ActiveModel::Serializer
  attributes :baby_id, :activity_log_id, :teacher_name

  attribute :start_time do
    object.start_time.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
  end

  attribute :stop_time, if: -> { object.stop_time } do
    object.stop_time.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
  end
end

# frozen_string_literal: true

class ActivityLogSerializer < ActiveModel::Serializer
  attributes :id, :baby_id, :assistant_id, :activity_id
  attribute :start_time do
    object.start_time.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
  end
  attribute :duration, if: -> { object.duration }
  attribute :comments, if: -> { object.comments }
  attribute :stop_time, if: -> { object.stop_time } do
    object.start_time.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
  end
end

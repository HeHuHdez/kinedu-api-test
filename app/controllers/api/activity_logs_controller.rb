# frozen_string_literal: true

module Api
  # ActivityLogs controller
  class ActivityLogsController < Api::BaseApiController
    before_action :set_activity_log, only: %i[update destroy]

    def create
      @activity_log = ActivityLog.new(activity_log_params)
      if @activity_log.save
        render json: @activity_log, status: :created
      else
        render json: @activity_log.errors, status: :unprocessable_entity, serializer: nil
      end
    end

    def update
      if @activity_log.update(activity_log_params)
        render json: @activity_log
      else
        render json: @activity_log.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @activity_log.destroy
    end

    private

    def activity_log_params
      params.require(:activity_log).permit(:baby_id, :assistant_id, :activity_id, :start_time, :stop_time, :comments)
    end

    def set_activity_log
      @activity_log = ActivityLog.find(params[:id])
    end
  end
end

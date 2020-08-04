# frozen_string_literal: true

module Api
  # Babies controller
  class BabiesController < Api::BaseApiController
    before_action :set_baby, only: :activity_logs

    def index
      @babies = Baby.page(params[:page] || 1)
      render json: @babies, each_serializer: BabySerializer
    end

    def activity_logs
      activities = @baby.filtered_activity_logs(params[:page] || 1)
      render json: activities, each_serializer: BabyLogSerializer
    end

    private

    def set_baby
      @baby = Baby.find(params[:id])
    end
  end
end

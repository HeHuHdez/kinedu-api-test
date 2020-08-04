# frozen_string_literal: true

module Api
  # Activities controller
  class ActivitiesController < Api::BaseApiController
    def index
      @activities = Activity.page(params[:page] || 1)
      render json: @activities, each_serializer: ActivitySerializer
    end
  end
end

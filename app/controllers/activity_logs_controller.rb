# frozen_string_literal: true

class ActivityLogsController < ApplicationController
  def index
    @babies = Baby.all.pluck(:name)
    @assistants = Assistant.all.pluck(:name)
    @activity_logs = ActivityLog.from_baby(params[:baby_name])
                                .from_assistant(params[:assistant_name])
                                .with_status(params[:status])
                                .paginated_select(params[:page] || 1)
  end
end

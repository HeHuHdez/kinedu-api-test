class ActivityLogsController < ApplicationController
  def index
    @activity_logs = ActivityLog.paginated_select(params[:page] || 1)
  end
end

class ProgressLogsController < ApplicationController
  def show
    @progress_log = ProgressLog.find(params[:id])
  end
end

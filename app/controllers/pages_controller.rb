class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @progress_logs = ProgressLog.all
    # Find a count of the project log details rows where
    # progress log ids match progress logs with the
    # user_id = current user
    @progress_log_details = ProgressLogDetail.all
    # Find a count of all instances where
    # progress log details.correct = true
    # / progress log detials.correct = false
  end
end

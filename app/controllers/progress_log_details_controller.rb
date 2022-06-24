class ProgressLogDetailsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def update
    progress_log_detail = ProgressLogDetail.find(params[:log_id])
    do_they_know = params[:do_they_know]
    if do_they_know == "true"
      progress_log_detail.update!(correct: true)
    else
      progress_log_detail.update!(correct: false)
    end
    progress_log_detail.save!
  end
end

class ProgressLogDetailsController < ApplicationController
  def update
    @progress_log_detail = ProgressLogDetail.where(card_id: card_id, progress_log_id: progress_log_id)
    if do_they_know == true
      @progress_log_detail.update(correct: true)
    else
      @progress_log_detail.update(correct: false)
    end
    @progress_log_detail.save
    flash[:notice] = do_they_know ? "Good job" : "Keep going"
  end
end

class ProgressLogsController < ApplicationController
  def show
    @progress_log = ProgressLog.find(params[:id])
    @deck = Deck.find(@progress_log.deck_id)
    @true = @progress_log.progress_log_details.where(correct: true)
    @false = @progress_log.progress_log_details.where(correct: false)
    @skip = @progress_log.progress_log_details.where(correct: nil)
  end
end

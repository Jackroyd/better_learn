class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @progress_logs = ProgressLog.all
    progress_logs = ProgressLog.where(user: current_user).pluck(:id)
    @progress_log_details = ProgressLogDetail
                            .where(progress_log_id: progress_logs, correct: [true, false]).count
    @correct_cards = ProgressLogDetail
                     .where(progress_log_id: progress_logs, correct: true).count
    @total_cards = ((@correct_cards.to_f / @progress_log_details.to_f) * 100).round(0)
    @decks = Deck.all.where(user: current_user)
  end
end

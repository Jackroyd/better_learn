class CardsController < ApplicationController
  def index
    @deck = Deck.find(params[:deck_id])
    @progress_log = ProgressLog.create(user_id: current_user.id, deck_id: @deck.id)
    @progress_logs = ProgressLog.where(user_id: current_user.id, deck_id: @deck.id)
    @last_log = @progress_logs.second_to_last
    @cards = @deck.cards
    @cards.each do |card|
      ProgressLogDetail.create(card_id: card.id, progress_log_id: @progress_log.id)
    end
    if @progress_logs.count > 1
     begin
      @cards = @cards.sort_by { |c| ProgressLogDetail.find_by(card_id: c.id, progress_log_id: @last_log.id).correct ? 1 : 0 }
     rescue NoMethodError
      @cards = @deck.cards
     end
    else
      @cards = @deck.cards
    end
  end

  def new
    @deck = Deck.find(params[:deck_id])
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @deck = Deck.find(params[:deck_id])
    @card.deck = @deck
    @card.user = current_user
    @card.save

    redirect_to deck_path(@deck)
  end

  private

  def card_params
    params.require(:card).permit(:question, :answer, :user_id, :deck_id)
  end
end

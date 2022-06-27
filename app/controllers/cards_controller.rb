class CardsController < ApplicationController
  def index
    @deck = Deck.find(params[:deck_id])
    @progress_log = ProgressLog.create(user_id: current_user.id, deck_id: @deck.id)
    @progress_logs = ProgressLog.where(user_id: current_user.id, deck_id: @deck.id)
    @cards = @deck.cards
    @cards.each do |card|
      ProgressLogDetail.create(card_id: card.id, progress_log_id: @progress_log.id)
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

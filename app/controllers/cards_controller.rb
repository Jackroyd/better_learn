class CardsController < ApplicationController
  def index
    @deck = Deck.find(params[:deck_id])
    @cards = @deck.cards
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

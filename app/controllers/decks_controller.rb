class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end

  def show
    @deck = Deck.find(params[:id])
    @rating = Rating.new
    @cards = Card.new
  end

  def new
    @deck = Deck.new
    @card = Card.new
  end

end

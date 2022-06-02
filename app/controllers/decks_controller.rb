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

  def create
    @deck = Bike.new(deck_params)
    @user = current_user
    @deck.user = @user
    @deck.save

    redirect_to decks_path(@deck)
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :subject, :topic, :level, :location, :description, :user_id)
  end

end

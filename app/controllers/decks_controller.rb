class DecksController < ApplicationController
  def index
    @deck = Deck.all
  end
end

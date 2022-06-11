class DecksController < ApplicationController
  def index
    if params[:query].present?
      @decks = Deck.decks_search(params[:query])
    else
      @decks = Deck.all
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/deck_cards', locals: { decks: @decks }, formats: [:html] }
    end

  end

  def show
    @deck = Deck.find(params[:id])
    @rating = Rating.new
    @cards = Card.new
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    @user = current_user
    @deck.user = @user
    if @deck.save
      redirect_to deck_path(@deck)
    else
      render :new
    end
  end

  def edit
    @deck = Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])
    @deck.update(deck_params)
    if @deck.save
      redirect_to deck_path(@deck)
    else
      render :edit
    end
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :subject, :topic, :level, :location, :description, :user_id, cards_attributes: [:id, :question, :answer, :deck_id])
  end
end

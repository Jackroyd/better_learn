class DecksController < ApplicationController
  def index
    if params[:query].present?
      @decks = Deck.by_sub_top_lev(params[:subject], params[:topic], params[:level]).decks_search(params[:query])
    else
      @decks = Deck.by_sub_top_lev(params[:subject], params[:topic], params[:level])
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/deck_cards', locals: { decks: @decks }, formats: [:html] }
    end
  end

  def show
    @deck = Deck.find(params[:id])
    @rating = Rating.new
    @cards = @deck.cards
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    @user = current_user
    @deck.user = @user
    if @deck.save
      flash[:notice] = "Deck created"
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
      render :show
      flash[:notice] = "Deck was updated"
      redirect_to deck_path(@deck)
    else
      render :edit
    end
    if @deck.update(rating: params[:deck][:rating])
      @toast = :success
    else
      @toast = :warning
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    if @deck.destroyed?
      flash[:notice] = "Deck deleted"
      redirect_to decks_path
    else
      redirect_to deck_path(@deck)
    end
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :subject, :topic, :level, :location, :description, :user_id, cards_attributes: [:id, :question, :answer, :deck_id, :_destroy])
  end
end

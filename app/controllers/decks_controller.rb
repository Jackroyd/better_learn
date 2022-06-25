class DecksController < ApplicationController
  def index
    if !(params[:query].blank?)
      if params[:subject].blank? && params[:level].blank?
        @decks = Deck.decks_search(params[:query])
      elsif params[:subject].blank? && !(params[:level].blank?)
        @decks = Deck.where(level: params[:level]).decks_search(params[:query])
      elsif params[:level].blank? && !(params[:subject].blank?)
        @decks = Deck.where(level: params[:subject]).decks_search(params[:query])
      else
        @decks = Deck.where(subject: params[:subject], level: params[:level]).decks_search(params[:query])
      end
    else
      if params[:subject].blank? && params[:level].blank?
        @decks = Deck.all
      elsif params[:subject].blank? && !(params[:level].blank?)
        @decks = Deck.where(level: params[:level])
      elsif params[:level].blank? && !(params[:subject].blank?)
        @decks = Deck.where(subject: params[:subject])
      else
        @decks = Deck.where(subject: params[:subject], level: params[:level])
      end
    end

    @decks = @decks.shuffle
    @subjects = Deck.all.distinct.pluck(:subject).sort
    @levels = Deck.all.distinct.pluck(:level).sort

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
    params.require(:deck).permit(:name, :subject, :level, :location, :description, :user_id, cards_attributes: [:id, :question, :answer, :deck_id, :_destroy])
  end
end

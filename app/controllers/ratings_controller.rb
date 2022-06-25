class RatingsController < ApplicationController
  def new
    @deck = Deck.find(params[:deck_id])
    @rating = Rating.new
  end

  def create
    @deck = Deck.find(params[:deck_id])
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.deck = @deck
    if @rating.save
      flash[:notice] = "Deck rated"
      redirect_to deck_path(@deck)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end

  end

  private

  def rating_params
    params.require(:rating).permit(:score)
  end
end

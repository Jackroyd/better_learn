class RatingsController < ApplicationController
  def new
    @deck = Deck.find(params[:deck_id])
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    if @rating.save
      flash[:notice] = "Thanks"
    else
      flash[:alert] = "Something went wrong."
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :deck_id)
  end
end

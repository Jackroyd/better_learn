class ChangeRatingInRatings < ActiveRecord::Migration[6.1]
  def change
    rename_column :ratings, :rating, :score
  end
end

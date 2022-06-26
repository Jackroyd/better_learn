class RemoveRatingFromDecks < ActiveRecord::Migration[6.1]
  def change
    remove_column :decks, :rating, :string
  end
end

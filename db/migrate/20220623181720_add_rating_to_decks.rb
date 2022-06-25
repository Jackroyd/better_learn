class AddRatingToDecks < ActiveRecord::Migration[6.1]
  def change
    add_column :decks, :rating, :integer, null: false, default: 0
  end
end

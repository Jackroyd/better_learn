class AddDescriptionToDecks < ActiveRecord::Migration[6.1]
  def change
    add_column :decks, :description, :text
  end
end

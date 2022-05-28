class CreateDecks < ActiveRecord::Migration[6.1]
  def change
    create_table :decks do |t|
      t.string :name
      t.string :subject
      t.string :topic
      t.string :level
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

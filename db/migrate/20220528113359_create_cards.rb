class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.text :question
      t.text :answer
      t.references :deck, null: false, foreign_key: true

      t.timestamps
    end
  end
end

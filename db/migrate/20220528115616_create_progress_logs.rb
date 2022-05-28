class CreateProgressLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :progress_logs do |t|
      t.text :correct
      t.text :incorrect
      t.references :user, null: false, foreign_key: true
      t.references :deck, null: false, foreign_key: true

      t.timestamps
    end
  end
end

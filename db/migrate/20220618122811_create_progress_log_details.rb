class CreateProgressLogDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :progress_log_details do |t|
      t.boolean :correct
      t.references :progress_log, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end

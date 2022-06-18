class RemoveColumnsFromProgressLogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :progress_logs, :correct, :text
    remove_column :progress_logs, :incorrect, :text
  end
end

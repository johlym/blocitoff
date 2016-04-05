class AddCompletionDatestampToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :completion_datestamp, :timestamp
  end
end

class AddCompletionToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :completion, :boolean
  end
end

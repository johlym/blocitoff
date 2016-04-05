class AddCreationDatestampToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :creation_datestamp, :date
  end
end

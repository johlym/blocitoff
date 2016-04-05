class AddDueDateDatestampToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :duedate_datestamp, :date
  end
end

class ChangeCreationDatestampToTimestampTypeColumn < ActiveRecord::Migration
  def change
    change_column :tasks, :creation_datestamp, :timestamp
    change_column :tasks, :duedate_datestamp, :timestamp
  end
end

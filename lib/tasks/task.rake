namespace :task do
  desc "Archive items older than 7 days"
  task archive_tasks: :environment do
    tasks = Task.where("created_at <= ?", Time.now - 7.days)
    p tasks
    tasks.each do |task|
      puts "Task #{task.name}, created on #{task.created_at} is being archived."
      task.archived = true
      task.save
    end
  end
end

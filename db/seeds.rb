# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

throttle = 20
task_count = rand(4..12)
sentence_length = rand(2..5)

## SEED USERS ##

puts "Creating Admin user"

User.create!(
    first_name: "Admin",
    last_name: "User",
    email: "admin@test.com",
    password: "admin1234",
    password_confirmation: "admin1234"
)


puts "Creating Users"

throttle.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email(first_name)
  password = Faker::Internet.password
  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password,
    password_confirmation: password
  )

end

## SEED TASKS ##

puts "Creating Tasks"

users = User.all

users.each do |user|
  task_count.times do
    Task.create!(
        name: Faker::Lorem.sentence(sentence_length),
        user_id: user.id
    )
  end
end

puts "Seed Complete."
puts "#{User.count} users created."
puts "#{Task.count} tasks created."



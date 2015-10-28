# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "admin@gmail.com",
            role: "Admin",
            password: "password",
            password_confirmation: "password")

2.times do |i|
  email = "example-#{i+1}@example.com"
  password = "password"
  User.create( email: email,
              role: "Artist",
              password: password,
              password_confirmation: password)
end

5.times do |n|
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create(email: email,
              role: "Venue",
              password: password,
              password_confirmation: password)
end

Profile.all.each do |profile|
  name = Faker::Name.name
  profile.update(name: name)
end

users = User.where('id < 4')
10.times do
  title = Faker::Book.title
  location = Faker::Address.street_address
  start_time = Faker::Time.between(DateTime.now + 20, DateTime.now)
  end_time = start_time + 1
  users.each { |user| user.events.create!(title: title,
                                        location: location,
                                        start_time: start_time,
                                        end_time: end_time,
                                        status: 'Pending') }
end

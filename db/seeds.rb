# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "大宅 康喜",
             email: "bei73ok@gmail.com",
             password:              "kK18732010",
             password_confirmation: "kK18732010",
             admin: true)

 users = User.order(:created_at).take(6)
 1.times do
   todo = Faker::Lorem.sentence(5)
   users.each { |user| user.todos.create!(todo: todo) }
 end

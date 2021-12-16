# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  require 'faker'

  puts "Creating Users..."
  (1..5).each do |id|
    User.create!(
      username: Faker::Name.name,
      email: Faker::Internet.email,
      password: "password",
      profession: Faker::Hobby.activity
    )
  end
  puts "Users done, starting projects"

    (1..6).each do |id|
      Project.create!(
        id: id,
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.sentences,
        user_id: rand(1..5),
        tag1: Faker::Hobby.activity,
	      tag2: Faker::Hobby.activity,
	      tag3: Faker::Hobby.activity,
      )
  end
  puts "Projects done"

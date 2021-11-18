require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
array = ["chinese", "italian", "japanese", "french", "belgian"]
10.times do
    restaurant = Restaurant.create(
        name: Faker::Restaurant.name,
        address: Faker::Address.street_address,
        phone_number: Faker::PhoneNumber.cell_phone,
        category: array.sample
    )
    puts "restaurant #{restaurant.id}"
end

puts "Cleaning review data"
Review.destroy_all

puts "Creating reviews..."
10.times do
    review = Review.create(
        content: Faker::Restaurant.review,
        rating: rand(1..5)
    )
    puts "review #{review.id}"
end
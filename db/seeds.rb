# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Booking.destroy_all
# Dragon.destroy_all
# User.destroy_all



10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.email,
  # password: Faker::Lorem.characters(number: 10, min_alpha: 4),
    password: "1234567",
    role: ["owner", "renter"].sample,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true)
    )
end

10.times do
   dragon = Dragon.create(
    nickname: Faker::JapaneseMedia::DragonBall.unique.character,
    country: ["France", "Iceland", "Alaska", "Argentina", "Botswana", "New Zealand", "China", "Thailand", "Japan", "Niger", "Iran"].sample,
    size: %w(small medium large xlarge).sample,
    speed: %w(slow medium fast superfast).sample,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true),
    user_id: (1..10).to_a.sample
    )
end

10.times do
   booking = Booking.create(
    user_id: (1..10).to_a.sample,
    dragon_id: (1..10).to_a.sample,
    status: ["pending", "cancelled", "accepted", "done"].sample,
    start_date: Faker::Date.in_date_period(year: 2021, month: 3),
    end_date: Faker::Date.in_date_period(year: 2021, month: 4)
    )
end



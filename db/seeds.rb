# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Booking.destroy_all
Workshop.destroy_all
Timeslot.destroy_all



david = User.create(email: 'david@qmail.com', password: 'apple322')
bob = User.create(email: 'bob@qmail.com', password: 'apple322')

dota2_workshop = Workshop.create(title: "D2 last hitting master class", description: "better than leageue")
league_workshop = Workshop.create(title: "League early game guide", description: "shitter version of dota")
valorant_workshop = Workshop.create(title: "Valorant aiming guide", description: "new cs go i guess")

booking1 = Booking.create(user: david, workshop: dota2_workshop)
booking2 = Booking.create(user: david, workshop: league_workshop)
booking3 = Booking.create(user: david, workshop: dota2_workshop)

morning_timeslot = Timeslot.create(day: "2022/05/22", start_time: "07:00:00", end_time: "09:00:00", price: 100, total_seats: 30, available_seats: 30)
afternoon_timeslot = Timeslot.create(day: "2022/05/22", start_time: "12:00:00", end_time: "14:00:00", price: 50, total_seats: 10, available_seats: 10)
late_timeslot = Timeslot.create(day: "2022/05/22", start_time: "20:00:00", end_time: "22:00:00", price: 200, total_seats: 10, available_seats: 10)

puts "Users: #{User.count}"
puts "Workshops: #{Workshop.count}"
puts "Bookings: #{Booking.count}"
puts "Timeslots: #{Timeslot.count}"

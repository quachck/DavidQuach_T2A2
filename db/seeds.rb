# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

david = User.create(first_name: 'david', last_name: 'quach', email: 'david@qmail.com', number: '1234567890', password: 'apple322')
bob = User.create(first_name: 'bob', last_name: 'bee',email: 'bob@qmail.com', number: '1234567890', password: 'apple322')
puts "Users: #{User.count}"
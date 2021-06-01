# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create( first_name: "Maria", last_name: "Sharapova", email: "maria@maria.com", username: "meatballz", password: "qwerty", phone_number: "0123456789", about: "Since i retired from competitive tennis, I now cook Swedish meatballs", allergies: ["peanuts", "clay courts"] )
User.create( first_name: "Björn", last_name: "Borg", email: "bjorn@bjorn.com", username: "bjorne", password: "qwerty", phone_number: "0123456789", about: "Since i retired from competitive tennis, I now make underwear and enjoy meatballs", allergies: ["John McEnroe"] )
Event.create( title: "Maria's Meatballz!", description: "tennis ball sized authentic Swedish meatballs, just like Björn used to make!", address: "Ålgrytevägen 5, 127 32 Skärholmen, Sweden", ingredients: "mince meat, onions, salt, butter, pepper", available_seats: 8, price: 100, user: User.first)
Event.create( title: "Maria's Sill & Potatis!", description: "Traditional Swedish Sill & Potatoes! with a russian serving of tennis", address: "LM Ericssons Väg 14, 126 27 Hägersten, Sweden", ingredients: "Sill (herring), potatoes", available_seats: 4, price: 85, user: User.first)
Reservation.create( user: User.last, event: Event.first, status: "pending", message: "Hi, I hate John" )
Reservation.create( user: User.last, event: Event.last, status: "pending", message: "Hi, I hate McEnroe" )
Chatroom.create( event: Event.first )
Chatroom.create( event: Event.last )


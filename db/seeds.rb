# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Passenger.destroy_all
Flight.destroy_all
Airline.destroy_all

# Airlines
airline_1 = Airline.create!(name: 'Southwest')
airline_2 = Airline.create!(name: 'United')

# Flights
flight_1 = airline_1.flights.create!(
  number: 'SWA123',
  date: '08/05/21',
  departure_city: 'Denver',
  arrival_city: 'Reno')
flight_2 = airline_1.flights.create!(
  number: 'SWA456',
  date: '09/09/21',
  departure_city: 'Denver',
  arrival_city: 'Las Vegas')
flight_3 = airline_2.flights.create!(
  number: 'UA789',
  date: '07/10/21',
  departure_city: 'New York',
  arrival_city: 'Boston')
flight_4 = airline_2.flights.create!(
  number: 'UA102',
  date: '12/01/21',
  departure_city: 'Houston',
  arrival_city: 'Los Angeles')

# Passengers
passenger_1 = Passenger.create!(name: 'Connor', age: 7)
passenger_2 = Passenger.create!(name: 'Brian', age: 12)
passenger_3 = Passenger.create!(name: 'Sally', age: 64)
passenger_4 = Passenger.create!(name: 'Joe', age: 43)
passenger_5 = Passenger.create!(name: 'Gus', age: 18)
passenger_6 = Passenger.create!(name: 'Mark', age: 72)

# Bookings
flight_1.passengers << passenger_1
flight_1.passengers << passenger_2
flight_1.passengers << passenger_4
flight_2.passengers << passenger_3
flight_2.passengers << passenger_4

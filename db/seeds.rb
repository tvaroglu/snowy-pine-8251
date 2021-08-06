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
airline_1.flights.create!(
  number: '1234',
  date: '08/05/21',
  departure_city: 'Denver',
  arrival_city: 'Reno')
airline_1.flights.create!(
  number: '5678',
  date: '09/09/21',
  departure_city: 'Denver',
  arrival_city: 'Las Vegas')
airline_2.flights.create!(
  number: 'UA123',
  date: '07/10/21',
  departure_city: 'New York',
  arrival_city: 'Boston')
airline_2.flights.create!(
  number: 'UA456',
  date: '12/01/21',
  departure_city: 'Houston',
  arrival_city: 'Los Angeles')

# Passengeres
passenger_1 = Passenger.create!(name: 'Connor', age: 7)
passenger_2 = Passenger.create!(name: 'Brian', age: 12)
passenger_3 = Passenger.create!(name: 'Sally', age: 5)
passenger_4 = Passenger.create!(name: 'Joe', age: 43)
passenger_5 = Passenger.create!(name: 'Gus', age: 18)
passenger_6 = Passenger.create!(name: 'Mark', age: 72)

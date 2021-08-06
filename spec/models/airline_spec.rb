require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it {should have_many :flights}
  end

  describe 'methods' do
    it 'can return a distinct list of adult passengers booked on all flights' do
      airline = Airline.create!(name: 'Southwest')
      flight_1 = airline.flights.create!(
        number: 'SWA123',
        date: '08/05/21',
        departure_city: 'Denver',
        arrival_city: 'Reno')
      flight_2 = airline.flights.create!(
        number: 'SWA456',
        date: '09/09/21',
        departure_city: 'Denver',
        arrival_city: 'Las Vegas')

      passenger_1 = Passenger.create!(name: 'Connor', age: 7)
      passenger_2 = Passenger.create!(name: 'Brian', age: 12)
      passenger_3 = Passenger.create!(name: 'Sally', age: 54)
      passenger_4 = Passenger.create!(name: 'Joe', age: 43)

      flight_1.passengers << passenger_1
      flight_1.passengers << passenger_2
      flight_1.passengers << passenger_3
      flight_2.passengers << passenger_3
      flight_2.passengers << passenger_4

      expected = Airline.booked_adult_passengers(airline.id)

      expect(expected.length).to eq(2)
      expect(expected.first.passenger_name).to eq(passenger_3.name)
      expect(expected.last.passenger_name).to eq(passenger_4.name)
    end
  end

end

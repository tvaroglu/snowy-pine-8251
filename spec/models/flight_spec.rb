require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'relationships' do
    it {should belong_to :airline}
    it {should have_many(:bookings)}
    it {should have_many(:passengers).through(:bookings)}
  end

  describe 'methods' do
    it 'can return the name of the airline' do
      airline = Airline.create!(name: 'Southwest')
      flight = airline.flights.create!(
        number: '1234',
        date: '08/05/21',
        departure_city: 'Denver',
        arrival_city: 'Reno')

      expect(flight.airline_name).to eq(airline.name)
    end

    it 'can determine if passengers are booked on the flight' do
      airline = Airline.create!(name: 'Southwest')
      flight_1 = airline.flights.create!(
        number: '1234',
        date: '08/05/21',
        departure_city: 'Denver',
        arrival_city: 'Reno')
      flight_2 = airline.flights.create!(
        number: 'SWA456',
        date: '09/09/21',
        departure_city: 'Denver',
        arrival_city: 'Las Vegas')
      passenger = Passenger.create!(name: 'Connor', age: 7)

      flight_1.passengers << passenger

      expect(flight_1.has_passengers?).to be true
      expect(flight_2.has_passengers?).to be false
    end
  end

end

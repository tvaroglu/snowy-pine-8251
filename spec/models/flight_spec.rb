require 'rails_helper'

RSpec.describe Flight, type: :model do
  it {should belong_to :airline}
  it {should have_many(:bookings)}
  it {should have_many(:passengers).through(:bookings)}

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
  end

end

require 'rails_helper'

RSpec.describe 'flights index' do

  before :each do
    @airline = Airline.create!(name: 'Southwest')
    @flight_1 = @airline.flights.create!(
      number: 'SWA123',
      date: '08/05/21',
      departure_city: 'Denver',
      arrival_city: 'Reno')
    @flight_2 = @airline.flights.create!(
      number: 'SWA456',
      date: '09/09/21',
      departure_city: 'Denver',
      arrival_city: 'Las Vegas')
    @flight_3 = @airline.flights.create!(
      number: 'SWA789',
      date: '07/10/21',
      departure_city: 'New York',
      arrival_city: 'Boston')

    @passenger_1 = Passenger.create!(name: 'Connor', age: 7)
    @passenger_2 = Passenger.create!(name: 'Brian', age: 12)
    @passenger_3 = Passenger.create!(name: 'Sally', age: 5)
    @passenger_4 = Passenger.create!(name: 'Joe', age: 43)

    @flight_1.passengers << @passenger_1
    @flight_1.passengers << @passenger_2
    @flight_2.passengers << @passenger_3
    @flight_2.passengers << @passenger_4
  end

  # User Story 1, Flights Index Page
    # As a visitor
    # When I visit the flights index page
    # I see a list of all flight numbers
    # And next to each flight number I see the name of the Airline of that flight
    # And under each flight number I see the names of all that flight's passengers
  it 'displays all flight numbers, the airline name, and all passenger names booked on the flight' do
    visit flights_path
    expect(page).to have_content('All Flights')

    within "#flight-#{@flight_1.id}" do
      expect(page).to have_content("#{@flight_1.airline_name}: #{@flight_1.number}")
      expect(page).to have_content("All Passengers Currently Booked:")
    end
    within "#passengers-#{@flight_1.id}_#{@passenger_1.id}" do
      expect(page).to have_content(@passenger_1.name)
    end
    within "#passengers-#{@flight_1.id}_#{@passenger_2.id}" do
      expect(page).to have_content(@passenger_2.name)
    end

    within "#flight-#{@flight_2.id}" do
      expect(page).to have_content("#{@flight_2.airline_name}: #{@flight_2.number}")
      expect(page).to have_content("All Passengers Currently Booked:")
    end
    within "#passengers-#{@flight_2.id}_#{@passenger_3.id}" do
      expect(page).to have_content(@passenger_3.name)
    end
    within "#passengers-#{@flight_2.id}_#{@passenger_4.id}" do
      expect(page).to have_content(@passenger_4.name)
    end

    within "#flight-#{@flight_3.id}" do
      expect(page).to have_content("No Passengers Currently Booked")
    end
  end

end

class BookingsController < ApplicationController

  def create
    flight = Flight.find(params[:flight_id])
    passenger = Passenger.find(params[:passenger_id])
    Booking.create(flight: flight, passenger: passenger)
    # redirect_to airline_flights_path
  end

  def destroy
    Booking.destroy(params[:booking_id])
    # redirect_to airline_flights_path
  end

end

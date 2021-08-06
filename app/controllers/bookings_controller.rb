class BookingsController < ApplicationController

  # def create
  # end

  def destroy
    booking = Booking.find_by(flight_id: params[:flight_id])
    booking.destroy
    redirect_to flights_path
  end

end

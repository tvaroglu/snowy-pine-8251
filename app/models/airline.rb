class Airline < ApplicationRecord
  has_many :flights

  def self.booked_adult_passengers(airline_id)
    Booking.select("DISTINCT passengers.id,
      passengers.name AS passenger_name,
      passengers.age AS passenger_age")
      .joins("INNER JOIN flights ON bookings.flight_id = flights.id")
      .joins("INNER JOIN airlines ON flights.airline_id = airlines.id")
      .joins("INNER JOIN passengers ON bookings.passenger_id = passengers.id")
      .where("airlines.id = ?", airline_id)
      .where("passengers.age > ?", 17)
  end

end

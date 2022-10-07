class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    params[:flight][:passengers].to_i.times { @booking.passengers.build }

    flight = Flight.find(params[:flight][:flight_id])
    @departure_airport = flight.departure_airport.code
    @arrival_airport = flight.departure_airport.code
    @date = flight.date.strftime('%d/%m/%Y')
  end

  def create
  end
end

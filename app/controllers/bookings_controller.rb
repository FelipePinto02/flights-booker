class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    params[:flight][:passengers].to_i.times { @booking.passengers.build }

    flight = Flight.find(params[:flight][:flight_id])
    @flight_id = params[:flight][:flight_id]
    @departure_airport = flight.departure_airport.code
    @arrival_airport = flight.departure_airport.code
    @date = flight.date.strftime('%d/%m/%Y')
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      puts 'saved'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end

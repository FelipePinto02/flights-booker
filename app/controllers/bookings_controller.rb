class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  def new
    passengers_amount = params[:flight][:passengers].to_i

    @booking = Booking.new
    passengers_amount.times { @booking.passengers.build }

    @flight = Flight.find(params[:flight][:flight_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @flight = Flight.find(params[:booking][:flight_id])

    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end

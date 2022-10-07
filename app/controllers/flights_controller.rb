class FlightsController < ApplicationController
  def index
    @flight = Flight.new
    @options = [Airport.airport_options, Flight.dates_options, [['1', 1], ['2', 2], ['3', 3], ['4', 4]]]
    @passengers = params[:flight][:passengers] if params[:flight]
    @flights = Flight.where(flight_search_params) if params[:flight]
  end

  private

  def flight_search_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :date)
  end
end

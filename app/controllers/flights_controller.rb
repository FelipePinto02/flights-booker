class FlightsController < ApplicationController
  def index
    @flight = Flight.new
    @options = [Airport.airport_options, Flight.dates_options, [['1', 1], ['2', 2], ['3', 3], ['4', 4]]]
    return unless params[:flight]

    @passengers = params[:flight][:passengers]
    @flights = Flight.where(flight_search_params)
    @departure_airport = Airport.find(params[:flight][:departure_airport_id]).code
    @arrival_airport = Airport.find(params[:flight][:arrival_airport_id]).code
  end

  private

  def flight_search_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :date)
  end
end

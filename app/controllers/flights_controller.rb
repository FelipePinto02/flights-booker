class FlightsController < ApplicationController
  def index
    @flights = params[:flight] ? Flight.where(flight_search_params) : Flight.new
    @departure_options = Airport.all.map { |a| [a.code, a.id] }
    @arrival_options = Airport.all.map { |a| [a.code, a.id] }
    @date_options = Flight.order(:date).pluck(:date).uniq.map { |d| [d.strftime('%d/%m/%Y'), d] }
    @passengers_options = [['1', 1], ['2', 2], ['3', 3], ['4', 4]]
    @passengers = params[:flight][:passengers]
  end

  def flight_search_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :date)
  end
end

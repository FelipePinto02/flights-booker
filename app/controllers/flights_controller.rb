class FlightsController < ApplicationController
  def index
    @flights = Flight.new
    @departure_options = Airport.all.map { |a| [a.code, a.id] }
    @arrival_options = Airport.all.map { |a| [a.code, a.id] }
    @date_options = Flight.order(:date).pluck(:date).uniq.map { |d| [d.strftime('%d/%m/%Y'), d] }
    @passengers_options = [['1', 1], ['2', 2], ['3', 3], ['4', 4]]
  end
end

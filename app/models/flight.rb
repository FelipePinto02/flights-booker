class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def self.dates_options
    order(:date).pluck(:date).uniq.map { |d| [d.strftime('%d/%m/%Y'), d] }
  end
end

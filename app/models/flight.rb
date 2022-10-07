class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  has_many :bookings
  has_many :passengers, through: :bookings

  def self.dates_options
    order(:date).pluck(:date).uniq.map { |d| [d.strftime('%d/%m/%Y'), d] }
  end

  def format_date
    date.strftime('%d/%m/%Y')
  end
end

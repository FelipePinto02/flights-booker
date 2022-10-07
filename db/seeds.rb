# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airports = Airport.create!(
  [
    { code: 'SDU' },
    { code: 'GRU' },
    { code: 'BSB' },
    { code: 'VCP' },
    { code: 'POA' }
  ]
)

airports.first.departing_flights.create!(
  [
    { arrival_airport_id: airports[1], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 55 },
    { arrival_airport_id: airports[2], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 105 },
    { arrival_airport_id: airports[3], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 66 },
    { arrival_airport_id: airports[4], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 115 }
  ]
)

airports[1].departing_flights.create!(
  [
    { arrival_airport_id: airports[0], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 55 },
    { arrival_airport_id: airports[2], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 100 },
    { arrival_airport_id: airports[3], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 72 },
    { arrival_airport_id: airports[4], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 104 }
  ]
)

airports[2].departing_flights.create!(
  [
    { arrival_airport_id: airports[0], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 105 },
    { arrival_airport_id: airports[1], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 100 },
    { arrival_airport_id: airports[3], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 98 },
    { arrival_airport_id: airports[4], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 165 }
  ]
)

airports[3].departing_flights.create!(
  [
    { arrival_airport_id: airports[0], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 66 },
    { arrival_airport_id: airports[1], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 72 },
    { arrival_airport_id: airports[2], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 98 },
    { arrival_airport_id: airports[4], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 95 }
  ]
)

airports.last.departing_flights.create!(
  [
    { arrival_airport_id: airports[0], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 115 },
    { arrival_airport_id: airports[1], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 104 },
    { arrival_airport_id: airports[2], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 165 },
    { arrival_airport_id: airports[3], date: Time.new(2022, 10, 1) + 86_400 * rand(25..30), duration: 95 }
  ]
)

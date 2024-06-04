# seeds.rb
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

cpt = Airport.find_or_create_by!(code: "CPT")
jnb = Airport.find_or_create_by!(code: "JNB")
bfn = Airport.find_or_create_by!(code: "BFN")
hla = Airport.find_or_create_by!(code: "HLA")
dur = Airport.find_or_create_by!(code: "DUR")

def generate_flight_days(start_date, days)
  (0...days).map { |day| start_date + day.days }
end

def generate_flight_times(start_date, days, min_flights_per_day, max_flights_per_day)
  flight_days = generate_flight_days(start_date, days)
  flight_times = []

  flight_days.each do |date|
    flights_per_day = rand(min_flights_per_day..max_flights_per_day)
    flights_per_day.times do |i|
      departure_time = date.change(hour: 6) + (i * 4).hours
      flight_times << departure_time
    end
  end
  flight_times
end

# Define the routes and their flight durations
routes = {
  [ cpt, jnb ] => 120,
  [ jnb, cpt ] => 120,
  [ jnb, dur ] => 90,
  [ dur, jnb ] => 90,
  [ bfn, hla ] => 95,
  [ hla, bfn ] => 95,
  [ hla, cpt ] => 150,
  [ cpt, hla ] => 150,
  [ dur, bfn ] => 105,
  [ bfn, dur ] => 105
}

# Generate and create flights for each route
routes.each do |(departure_airport, arrival_airport), duration|
  start_date = DateTime.new(2024, 6, 10)
  days = 6
  min_flights_per_day = 0
  max_flights_per_day = 4

  flight_times = generate_flight_times(start_date, days, min_flights_per_day, max_flights_per_day)

  flight_times.each do |time|
    Flight.create!(
      departure_airport: departure_airport,
      arrival_airport: arrival_airport,
      departure_time: time,
      duration: duration
    )
  end
end

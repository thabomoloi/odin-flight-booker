class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def self.unique_departure_dates
    select("DISTINCT DATE(departure_time) AS formatted_date")
      .order("formatted_date")
      .map { |f| f.formatted_date.to_s }
  end

  def self.by_airport_codes_and_date(departure_airport_code, arrival_airport_code, date)
    flights = Flight.where("DATE(departure_time) = ?", date)
    flights.select { |flight| flight.departure_airport.code == departure_airport_code &&  flight.arrival_airport.code == arrival_airport_code }
  end
end

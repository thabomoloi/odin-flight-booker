class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def self.unique_departure_dates
    select("DISTINCT DATE(departure_time) AS formatted_date")
      .order("formatted_date")
      .map { |f| f.formatted_date.to_s }
  end
end

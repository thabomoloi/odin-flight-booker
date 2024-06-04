class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { | airport | airport.code  }
    @unique_departure_dates = Flight.unique_departure_dates
    @flight_details = {}

    required_params = [ :departure_code, :arrival_code, :date, :num_tickets ]

    if required_params.all? { |param| params[param].present? }
      @date = Date.parse(params[:date]) rescue nil
      @flight_details = params.slice(:departure_code, :arrival_code, :date, :num_tickets)
      @flights = Flight.where("DATE(departure_time) = ?", @date)
    end
  end
end

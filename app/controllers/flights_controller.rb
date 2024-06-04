class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { | airport | airport.code  }
    @unique_departure_dates =  Flight.unique_departure_dates.map { |d| [ Date.parse(d).strftime("%A, %d %B %Y"), d ] }
    @flight_details = {}

    required_params = [ :departure_code, :arrival_code, :date, :num_tickets ]

    if required_params.all? { |param| params[param].present? }
      @date = Date.parse(params[:date]) rescue nil
      @flight_details = params.slice(:departure_code, :arrival_code, :date, :num_tickets)

      @flights = Flight.by_airport_codes_and_date(params[:departure_code], params[:arrival_code], @date)
    end
  end
end

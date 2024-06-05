class BookingsController < ApplicationController
  def new
    required_params = [ :flight_id, :num_tickets ]
    if required_params.all? { |param| params[param].present? }
      @num_passengers = params[:num_tickets].to_i
      @flight = Flight.find(params[:flight_id])
      @booking = Booking.new
    else
      redirect_back(fallback_location: root_path)
    end
  end
  def create
  end
end

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
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email ])
  end
end

class PassengerMailer < ApplicationMailer
  default from: "support@odinaiways.com"

  def booking_confirmation
    @passenger = params[:passenger]
    @flight = @passenger.flight
    @booking = @passenger.booking
    mail(to: @passenger.email, subject: "Your Flight Ticket Confirmation - #{@flight.id} on #{@flight.departure_time.strftime('%Y-%m-%d')}")
  end
end

defmodule FlightBooking.Bookings.CreateOrUpdate do
  alias FlightBooking.Bookings.Agent, as: BookingAgent
  alias FlightBooking.Bookings.Booking
  alias FlightBooking.Users.Agent, as: UserAgent

  def call(%{user_id: user_id, date: date, origin: origin, destination: destination}) do
    with {:ok, user} <- UserAgent.get(user_id),
         {:ok, booking} <- Booking.build(user, date, origin, destination) do
      BookingAgent.save(booking)
    else
      err ->
        err
    end
  end
end

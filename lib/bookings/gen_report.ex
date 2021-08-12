defmodule FlightBooking.Bookings.GenReport do
  alias FlightBooking.Bookings.Agent, as: BookingAgent
  alias FlightBooking.Bookings.Booking

  def create(filename \\ "bookings.csv") do
    booking_list = build_booking_list()
    File.write(filename, booking_list)
  end

  defp build_booking_list do
    BookingAgent.get_all()
    |> Map.values()
    |> Enum.map(&order_string/1)
  end

  defp order_string(%Booking{
         user_id: user_id,
         user_name: name,
         date: date,
         origin: origin,
         destination: destination
       }) do
    "#{user_id}, #{name}, #{date}, #{origin}, #{destination}\n"
  end
end

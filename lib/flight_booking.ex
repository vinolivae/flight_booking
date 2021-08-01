defmodule FlightBooking do
  alias FlightBooking.Bookings.Agent, as: BookingAgent
  alias FlightBooking.Bookings.CreateOrUpdate, as: CreateOrUpdateBooking

  alias FlightBooking.Users.Agent, as: UserAgent
  alias FlightBooking.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents do
    BookingAgent.start_link(%{})
    UserAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_booking(params), to: CreateOrUpdateBooking, as: :call
end

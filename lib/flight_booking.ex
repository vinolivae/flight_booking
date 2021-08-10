defmodule FlightBooking do
  alias FlightBooking.Bookings.Agent, as: BookingAgent
  alias FlightBooking.Bookings.ManageAgent, as: ManageAgentBooking

  alias FlightBooking.Users.Agent, as: UserAgent
  alias FlightBooking.Users.ManageAgent, as: ManageAgentUser

  def start_agents do
    BookingAgent.start_link(%{})
    UserAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: ManageAgentUser, as: :call
  defdelegate get_user(param), to: ManageAgentUser, as: :get
  defdelegate get_all_users(), to: ManageAgentUser, as: :get_all

  defdelegate create_or_update_booking(params), to: ManageAgentBooking, as: :call
  defdelegate get_booking(param), to: ManageAgentBooking, as: :get
  defdelegate get_all_bookings, to: ManageAgentBooking, as: :get_all
end

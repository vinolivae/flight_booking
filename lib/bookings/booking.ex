defmodule FlightBooking.Bookings.Booking do
  alias FlightBooking.Users.User

  @keys [:user_id, :date, :origin, :destination]
  @enforce_keys @keys
  defstruct @keys

  def build(%User{id: user_id}, date, origin, destination) do
    {:ok, %__MODULE__{user_id: user_id, date: date, origin: origin, destination: destination}}
  end

  def build(_user, _date, _origin, _destination), do: {:error, "Invalid params"}
end

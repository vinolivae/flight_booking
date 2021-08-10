defmodule FlightBooking.Bookings.Booking do
  alias FlightBooking.Users.User

  @keys [:user_id, :user_name, :date, :origin, :destination]
  @enforce_keys @keys
  defstruct @keys

  @spec build(
          user :: %User{},
          user_id :: String.t(),
          date :: String.t(),
          origin :: String.t(),
          destination :: String.t()
        ) :: {:ok, Booking.t()} | {:error, String.t()}
  def build(%User{name: name}, user_id, date, origin, destination) do
    {:ok,
     %__MODULE__{
       user_id: user_id,
       user_name: name,
       date: date,
       origin: origin,
       destination: destination
     }}
  end

  def build(_user, _user_id, _date, _origin, _destination), do: {:error, "Invalid params"}
end

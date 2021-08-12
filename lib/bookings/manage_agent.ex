defmodule FlightBooking.Bookings.ManageAgent do
  alias FlightBooking.Bookings.Agent, as: BookingAgent
  alias FlightBooking.Bookings.Booking
  alias FlightBooking.Users.Agent, as: UserAgent

  @doc """
  Build or update a booking.

  testing on iex:

  iex> booking_params = %{user_id: "user_id", date: NaiveDateTime.utc_now(), origin: "city", destination: "city"}
  %{
    date: ~N[2021-08-10 11:48:31.757414],
    destination: "city",
    origin: "city",
    user_id: "user_id"
  }
  iex> FlightBooking.create_or_update_booking booking_params
  {:ok, uuid}
  """
  def call(%{
        user_id: user_id,
        date: date,
        origin: origin,
        destination: destination
      }) do
    with {:ok, user} <- UserAgent.get(user_id),
         {:ok, booking} <- Booking.build(user, user_id, date, origin, destination) do
      BookingAgent.save(booking)
    else
      err ->
        err
    end
  end

  @doc """
  Get a booking by id.

  testing on iex:

  iex> FlightBooking.get_booking booking_id
  {:ok,
    %FlightBooking.Bookings.Booking{
    date: ~N[2021-08-10 11:48:31.757414],
    destination: "city",
    origin: "city",
    user_id: "user_id",
    user_name: "any"
  }}
  """
  def get(id) when is_binary(id) do
    BookingAgent.get(id)
  end

  @doc """
  Get all bookings regardless of id.

  testing on iex:

  iex> FlightBooking.get_all_bookings
  %{
    "id" => %FlightBooking.Bookings.Booking{
    date: ~N[2021-08-10 11:48:31.757414],
    destination: "city",
    origin: "city",
    user_id: "user_id",
    user_name: "any"
  }}
  """
  def get_all, do: BookingAgent.get_all()
end

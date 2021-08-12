defmodule FlightBooking.Factory do
  use ExMachina

  alias FlightBooking.Bookings.Booking
  alias FlightBooking.Users.User

  def user_factory do
    %User{
      id: UUID.uuid4(),
      name: "John Doe",
      email: "john_doe@email.com",
      cpf: "12345678910"
    }
  end

  def booking_factory do
    %Booking{
      user_name: "John Doe",
      user_id: UUID.uuid4(),
      date: NaiveDateTime.utc_now(),
      origin: "Aracaju",
      destination: "Recife"
    }
  end
end

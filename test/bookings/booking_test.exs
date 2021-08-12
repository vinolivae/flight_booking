defmodule FlightBooking.Bookings.BookingTest do
  use ExUnit.Case, async: true
  import FlightBooking.Factory
  alias FlightBooking.Bookings.Booking

  describe "build/1" do
    test "succeeds if booking are built correctly" do
      user = build(:user)
      booking = build(:booking)

      assert {:ok, %Booking{}} =
               Booking.build(
                 user,
                 booking.user_id,
                 booking.date,
                 booking.origin,
                 booking.destination
               )
    end

    test "fails if booking arent built correctly" do
      booking = build(:booking)

      assert {:error, "Invalid Booking params"} =
               Booking.build(
                 nil,
                 booking.user_id,
                 booking.date,
                 booking.origin,
                 booking.destination
               )
    end
  end
end

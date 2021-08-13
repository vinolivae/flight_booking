defmodule FlightBooking.FlightBookingTest do
  use ExUnit.Case, async: true
  import FlightBooking.Factory
  alias FlightBooking.Users.Agent, as: UserAgent
  alias FlightBooking.Users.User

  alias FlightBooking.Bookings.Agent, as: BookingAgent
  alias FlightBooking.Bookings.Booking

  describe "test delegates for user" do
    setup do
      FlightBooking.start_agents()
      user = build(:user)
      {:ok, user: user}
    end

    test "succeeds if user are created", %{user: user} do
      assert {:ok, _uuid} = FlightBooking.create_or_update_user(user)
    end

    test "succeeds if user are loaded", %{user: user} do
      assert {:ok, user_id} = UserAgent.save(user)
      assert {:ok, _user} = FlightBooking.get_user(user_id)
    end

    test "succeeds if all users are loaded", %{user: user} do
      assert {:ok, user_id} = UserAgent.save(user)
      assert %{^user_id => %User{}} = FlightBooking.get_all_users()
    end
  end

  describe "test delegates for bookings" do
    setup do
      FlightBooking.start_agents()
      user = build(:user)
      booking = build(:booking, user_id: user.id, user_name: user.name)
      {:ok, booking: booking, user: user}
    end

    test "succeeds if booking are created", %{booking: booking, user: user} do
      assert {:ok, _user_id} = UserAgent.save(user)
      assert {:ok, _uuid} = FlightBooking.create_or_update_booking(booking)
    end

    test "succeeds if booking are loaded", %{booking: booking} do
      assert {:ok, booking_id} = BookingAgent.save(booking)
      assert {:ok, _booking} = FlightBooking.get_booking(booking_id)
    end

    test "succeeds if all bookings are loaded", %{booking: booking} do
      assert {:ok, booking_id} = BookingAgent.save(booking)
      assert %{^booking_id => %Booking{}} = FlightBooking.get_all_bookings()
    end
  end
end

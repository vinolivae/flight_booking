defmodule FlightBooking.Bookings.ManageAgentTest do
  use ExUnit.Case, async: true

  import FlightBooking.Factory

  alias FlightBooking.Bookings.Agent, as: BookingAgent
  alias FlightBooking.Bookings.{Booking, ManageAgent}

  alias FlightBooking.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      FlightBooking.start_agents()
      user = build(:user)
      UserAgent.save(user)
      booking = build(:booking, user_id: user.id)
      {:ok, booking: booking}
    end

    test "succeeds if booking are create corectly", %{booking: booking} do
      assert {:ok, _uuid} = ManageAgent.call(booking)
    end

    test "fails if booking user is not found" do
      booking = build(:booking, user_id: "qualquer id")
      assert {:error, :user_not_found} = ManageAgent.call(booking)
    end
  end

  describe "get/1" do
    setup do
      BookingAgent.start_link(%{})
      :ok
    end

    test "succeeds if get the booking" do
      booking = build(:booking)
      assert {:ok, uuid} = BookingAgent.save(booking)
      assert %{^uuid => %Booking{}} = ManageAgent.get_all()
    end

    test "fails if booking id is invalid" do
      assert {:error, :booking_not_found} = ManageAgent.get("qualquer id")
    end
  end

  describe "get_all/0" do
    test "succeeds if get all bookings" do
      BookingAgent.start_link(%{})
      booking = build(:booking)
      assert {:ok, uuid} = BookingAgent.save(booking)
      assert %{^uuid => %Booking{}} = ManageAgent.get_all()
    end
  end
end

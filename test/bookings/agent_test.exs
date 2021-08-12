defmodule FlightBooking.Bookings.AgentTest do
  use ExUnit.Case, async: true
  import FlightBooking.Factory
  alias FlightBooking.Bookings.{Agent, Booking}

  describe "start_link/1" do
    test "succeeds if agent is linked successfully" do
      assert {:ok, _pid} = Agent.start_link(%{})
    end
  end

  describe "save/1" do
    setup do
      user = build(:user)
      booking = build(:booking, user_id: user.id, user_name: user.name)
      Agent.start_link(%{})
      {:ok, booking: booking}
    end

    test "saves the booking", %{booking: booking} do
      assert {:ok, _booking_id} = Agent.save(booking)
    end
  end

  describe "get/1" do
    setup do
      booking = build(:booking)
      Agent.start_link(%{})
      {:ok, booking: booking}
    end

    test "returns the booking", %{booking: booking} do
      assert {:ok, uuid} = Agent.save(booking)
      assert {:ok, _booking} = Agent.get(uuid)
    end

    test "fails if booking is is invalid" do
      assert {:error, :booking_not_found} = Agent.get(157)
    end
  end

  describe "get_all/0" do
    test "succeeds if get all bookings" do
      Agent.start_link(%{})
      booking = build(:booking)
      assert {:ok, uuid} = Agent.save(booking)
      assert %{^uuid => %Booking{}} = Agent.get_all()
    end
  end
end

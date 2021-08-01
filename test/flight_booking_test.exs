defmodule FlightBookingTest do
  use ExUnit.Case
  doctest FlightBooking

  test "greets the world" do
    assert FlightBooking.hello() == :world
  end
end

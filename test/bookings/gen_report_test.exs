defmodule FlightBooking.Bookings.GenReportTest do
  use ExUnit.Case, async: true
  import FlightBooking.Factory
  alias FlightBooking.Bookings.Agent, as: BookingAgent
  alias FlightBooking.Bookings.GenReport

  describe "create/1" do
    test "creates report file" do
      BookingAgent.start_link(%{})
      date = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)

      booking_1 = build(:booking, user_id: "1", date: date)
      BookingAgent.save(booking_1)

      booking_2 = build(:booking, user_id: "2", date: date)
      BookingAgent.save(booking_2)

      GenReport.create("bookings.csv")

      assert File.read!("bookings.csv") ==
               "#{booking_1.user_id}, John Doe, #{date}, Aracaju, Recife" <>
                 "#{booking_2.user_id}, John Doe, #{date}, Aracaju, Recife"
    end
  end
end

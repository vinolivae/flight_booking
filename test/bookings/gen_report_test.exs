defmodule FlightBooking.Bookings.GenReportTest do
  use ExUnit.Case, async: true
  import FlightBooking.Factory
  alias FlightBooking.Bookings.Agent, as: BookingAgent
  alias FlightBooking.Bookings.GenReport

  describe "create/1" do
    test "creates report file" do
      BookingAgent.start_link(%{})

      :booking
      |> build(user_name: "Ellen Ana")
      |> BookingAgent.save()

      :booking
      |> build(user_name: "Vinicius Oliveira")
      |> BookingAgent.save()

      :booking
      |> build(user_name: "Marcos Rafael")
      |> BookingAgent.save()

      :booking
      |> build(user_name: "Willians Taylor")
      |> BookingAgent.save()

      :booking
      |> build(user_name: "Valmira Placida")
      |> BookingAgent.save()

      GenReport.create("bookings_test.csv")

      assert {:ok, content} = File.read("bookings_test.csv")
      assert File.read!("bookings_test.csv") == content
    end
  end
end

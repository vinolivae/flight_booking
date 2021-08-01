defmodule FlightBooking.Bookings.Agent do
  use Agent

  alias FlightBooking.Bookings.Booking

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%Booking{} = booking) do
    uuid = UUID.uuid4()
    Agent.update(__MODULE__, &update_state(&1, booking, uuid))
    {:ok, uuid}
  end

  defp update_state(state, %Booking{} = booking, uuid), do: Map.put(state, uuid, booking)

  def get(uuid), do: Agent.get(__MODULE__, &get_booking(&1, uuid))

  def get_all, do: Agent.get(__MODULE__, & &1)

  defp get_booking(state, uuid) do
    case Map.get(state, uuid) do
      nil -> {:error, :booking_not_found}
      booking -> {:ok, booking}
    end
  end
end

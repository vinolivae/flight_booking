defmodule FlightBooking.Users.Agent do
  use Agent

  alias FlightBooking.Users.User

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%User{} = user), do: Agent.update(__MODULE__, &update_state(&1, user))

  defp update_state(state, %User{id: id} = user), do: Map.put(state, id, user)

  def get(uuid), do: Agent.get(__MODULE__, &get_user(&1, uuid))

  def get_all, do: Agent.get(__MODULE__, & &1)

  defp get_user(state, uuid) do
    case Map.get(state, uuid) do
      nil -> {:error, :user_not_found}
      user -> {:ok, user}
    end
  end
end

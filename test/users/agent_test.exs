defmodule FlightBooking.Users.AgentTest do
  use ExUnit.Case, async: true
  import FlightBooking.Factory
  alias FlightBooking.Users.Agent

  describe "start_link/1" do
    test "succeeds if agent is linked successfully" do
      assert {:ok, _pid} = Agent.start_link(%{})
    end
  end

  describe "save/1" do
    setup do
      user = build(:user)
      Agent.start_link(%{})
      {:ok, user: user}
    end

    test "saves the user", %{user: user} do
      assert {:ok, _user_id} = Agent.save(user)
    end
  end

  describe "get/1" do
    setup do
      user = build(:user)
      Agent.start_link(%{})
      {:ok, user: user}
    end

    test "returns the user", %{user: user} do
      assert {:ok, uuid} = Agent.save(user)
      assert {:ok, _user} = Agent.get(uuid)
    end

    test "fails if user is is invalid" do
      assert {:error, :user_not_found} = Agent.get(157)
    end
  end
end

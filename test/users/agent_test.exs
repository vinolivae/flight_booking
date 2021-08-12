defmodule FlightBooking.Users.AgentTest do
  use ExUnit.Case, async: true
  import FlightBooking.Factory
  alias FlightBooking.Users.{Agent, User}

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

  describe "get_all/0" do
    test "succeeds if get all users" do
      Agent.start_link(%{})
      user = build(:user)
      assert {:ok, uuid} = Agent.save(user)
      assert %{^uuid => %User{}} = Agent.get_all()
    end
  end
end

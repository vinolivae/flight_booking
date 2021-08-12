defmodule FlightBooking.Users.ManageAgentTest do
  use ExUnit.Case, async: true

  import FlightBooking.Factory

  alias FlightBooking.Users.Agent, as: UserAgent
  alias FlightBooking.Users.{ManageAgent, User}

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})
      user = build(:user)
      {:ok, user: user}
    end

    test "succeeds if user are create corectly", %{user: user} do
      assert {:ok, _uuid} = ManageAgent.call(user)
    end

    test "fails if cpf param is incorrect" do
      user = build(:user, cpf: nil)
      assert {:error, "Invalid User params"} = ManageAgent.call(user)
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "succeeds if get the user" do
      user = build(:user)
      assert {:ok, uuid} = UserAgent.save(user)
      assert %{^uuid => %User{}} = ManageAgent.get_all()
    end

    test "fails if user id is invalid" do
      assert {:error, :user_not_found} = ManageAgent.get("qualquer id")
    end
  end

  describe "get_all/0" do
    test "succeeds if get all users" do
      UserAgent.start_link(%{})
      user = build(:user)
      assert {:ok, uuid} = UserAgent.save(user)
      assert %{^uuid => %User{}} = ManageAgent.get_all()
    end
  end
end

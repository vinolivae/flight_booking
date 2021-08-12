defmodule FlightBooking.Users.UserTest do
  use ExUnit.Case, async: true
  import FlightBooking.Factory
  alias FlightBooking.Users.User

  describe "build/1" do
    test "succeeds if user are built correctly" do
      user = build(:user)

      assert {:ok, %User{}} =
               User.build(
                 user.id,
                 user.name,
                 user.email,
                 user.cpf
               )
    end

    test "fails if user arent built correctly" do
      user = build(:user)

      assert {:error, "Invalid User params"} =
               User.build(
                 user.id,
                 user.name,
                 user.email,
                 nil
               )
    end
  end
end

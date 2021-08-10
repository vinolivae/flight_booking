defmodule FlightBooking.Users.ManageAgent do
  alias FlightBooking.Users.Agent, as: UserAgent
  alias FlightBooking.Users.User

  @doc """
  Build or update a user.

  testing on iex:
  iex> user_params = %{name: "any", email: "any@email.com", cpf: "12345678910"}
  %{
    cpf: "12345678910",
    email: "any@email.com",
    id: "df5fb348-8e79-4ee0-90db-52a6968c6f1d",
    name: "any"
  }
  iex> FlightBooking.create_or_update_user(user_params)
    {:ok, uuid}
  """
  def call(%{name: name, email: email, cpf: cpf}) do
    name
    |> User.build(email, cpf)
    |> save_user()
  end

  @doc """
  Get a user by id.

  testing on iex:

  iex> FlightBooking.get_user user_id
  {:ok,
    %FlightBooking.Users.User{
    cpf: "12345678910",
    email: "any@email.com",
    name: "any"
  }}
  """
  def get(id) when is_binary(id) do
    UserAgent.get(id)
  end

  @doc """
  Get all users regardless of id.

  testing on iex:

  iex> FlightBooking.get_all_users
  %{
    "id" => %FlightBooking.Users.User{
    cpf: "12345678910",
    email: "any@email.com",
    name: "any"
  }
  }
  """
  def get_all(), do: UserAgent.get_all()

  defp save_user({:ok, %User{} = user}) do
    UserAgent.save(user)
  end

  defp save_user({:error, _reason} = err), do: err
end

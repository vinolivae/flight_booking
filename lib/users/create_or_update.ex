defmodule FlightBooking.Users.CreateOrUpdate do
  alias FlightBooking.Users.Agent, as: UserAgent
  alias FlightBooking.Users.User

  def call(%{id: id, name: name, email: email, cpf: cpf}) do
    id
    |> User.build(name, email, cpf)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}) do
    UserAgent.save(user)
    {:ok, :user_created_or_updated}
  end

  defp save_user({:error, _reason} = err), do: err
end

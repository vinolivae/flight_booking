defmodule FlightBooking.Users.User do
  @keys [:name, :email, :cpf]
  @enforce_keys @keys
  defstruct @keys

  @spec build(
          name :: String.t(),
          email :: String.t(),
          cpf :: String.t()
        ) :: {:ok, User.t()} | {:error, String.t()}
  def build(name, email, cpf) when is_bitstring(cpf) do
    {:ok, %__MODULE__{name: name, email: email, cpf: cpf}}
  end

  def build(_name, _email, _cpf), do: {:error, "Invalid parameters"}
end

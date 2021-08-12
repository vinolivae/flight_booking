defmodule FlightBooking.Users.User do
  @keys [:id, :name, :email, :cpf]
  @enforce_keys @keys
  defstruct @keys

  @spec build(
          id :: String.t(),
          name :: String.t(),
          email :: String.t(),
          cpf :: String.t()
        ) :: {:ok, User.t()} | {:error, String.t()}
  def build(id, name, email, cpf) when is_bitstring(cpf) do
    {:ok, %__MODULE__{id: id, name: name, email: email, cpf: cpf}}
  end

  def build(_id, _name, _email, _cpf), do: {:error, "Invalid User params"}
end

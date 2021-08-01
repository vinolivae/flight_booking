defmodule FlightBooking.Users.User do
  @keys [:id, :name, :email, :cpf]
  @enforce_keys @keys
  defstruct @keys

  @spec build(
          name :: String.t(),
          email :: String.t(),
          cpf :: String.t()
        ) ::
          {:error, String.t()}
          | {:ok, User.t()}
  def build(id, name, email, cpf) when is_bitstring(cpf) do
    {:ok, %__MODULE__{id: id, name: name, email: email, cpf: cpf}}
  end

  def build(_name, _email, _cpf), do: {:error, "Invalid parameters"}
end

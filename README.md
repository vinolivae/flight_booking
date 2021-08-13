# Flight Booking

### O objetivo da aplicação é criar uma forma de reservar voos e guardar seus dados utilizando agents. 

## Funcionalidades Presentes

- [x] Criação de usuário.
- [x] Criação de reserva.
- [x] Persistência local utilizando Agents.
- [x]  Geração de .csv para guardar todas as reservas.

## Coveralls result:

COV    |  FILE                          |            LINES |RELEVANT  | MISSED
-------|--------------------------------|------------------|----------|-------
100.0% | lib/bookings/agent.ex          |               28 |       7  |     0
  0.0% |lib/bookings/booking.ex         |               27 |       0  |     0
100.0% |lib/bookings/gen_report.ex      |               25 |       4  |     0
100.0% |lib/bookings/manage_agent.ex    |               71 |       6  |     0
100.0% |lib/flight_booking.ex           |               20 |       8  |     0
100.0% |lib/users/agent.ex              |               27 |       7  |     0
100.0% |lib/users/manage_agent.ex       |               63 |       5  |     0
  0.0% |lib/users/user.ex               |               17 |       0  |     0
100.0% |test/support/factory.ex         |               25 |       2  |     0
[TOTAL]|100.0%                          |                  |          |  



Utilize os arquivos nomeados como "manage" para obter formas de testar utilizando o IEX.

- Resultado que obtive utilizando o IEX.

```elixir                                   
8:37:24 › iex -S mix
Erlang/OTP 23 [erts-11.1.8] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe]

Compiling 1 file (.ex)
Interactive Elixir (1.11.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>  FlightBooking.start_agents
{:ok, #PID<0.215.0>}
iex(2)> user_params = %{name: "any", email: "any@email.com", cpf: "12345678910"}
%{cpf: "12345678910", email: "any@email.com", name: "any"}
iex(3)> FlightBooking.create_or_update_user user_params
{:ok, "d42b7ff7-f907-4a1c-8c3a-484e5324e828"}
iex(4)>  FlightBooking.get_user "d42b7ff7-f907-4a1c-8c3a-484e5324e828"
{:ok,
 %FlightBooking.Users.User{
   cpf: "12345678910",
   email: "any@email.com",
   name: "any"
 }}
iex(5)> FlightBooking.get_all_users
%{
  "d42b7ff7-f907-4a1c-8c3a-484e5324e828" => %FlightBooking.Users.User{
    cpf: "12345678910",
    email: "any@email.com",
    name: "any"
  }
}
iex(6)> booking_params = %{user_id: "d42b7ff7-f907-4a1c-8c3a-484e5324e828", date: NaiveDateTime.utc_now(), origin: "aracaju", destination: "sao paulo"}
%{
  date: ~N[2021-08-10 11:48:31.757414],
  destination: "sao paulo",
  origin: "aracaju",
  user_id: "d42b7ff7-f907-4a1c-8c3a-484e5324e828"
}
iex(7)> FlightBooking.create_or_update_booking booking_params
{:ok, "a8a6d868-b78f-4bd1-9da1-7454728a1955"}
iex(8)> FlightBooking.get_booking "a8a6d868-b78f-4bd1-9da1-7454728a1955"
{:ok,
 %FlightBooking.Bookings.Booking{
   date: ~N[2021-08-10 11:48:31.757414],
   destination: "sao paulo",
   origin: "aracaju",
   user_id: "d42b7ff7-f907-4a1c-8c3a-484e5324e828",
   user_name: "any"
 }}
iex(14)> 
```

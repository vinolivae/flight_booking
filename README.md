# Flight Booking

### O objetivo da aplicação é criar uma forma de reservar voos. Temos cadastro de usuário e cadastro de reserva de voo.


- Um exemplo de como testar o código locamente

```elixir
Erlang/OTP 23 [erts-11.1.8] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe]

Compiling 7 files (.ex)
Generated flight_booking app
Interactive Elixir (1.11.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> alias FlightBooking.Users.User
FlightBooking.Users.User
iex(2)> alias FlightBooking.Bookings.Booking
FlightBooking.Bookings.Booking
iex(3)> {:ok, user} = User.build(UUID.uuid4, "vinicius", "vinicius@email", "1234423232")
{:ok,
 %FlightBooking.Users.User{
   cpf: "1234423232",
   email: "vinicius@email",
   id: "2aadf6d6-a857-4072-82b4-a984843000f8",
   name: "vinicius"
 }}
iex(4)> alias FlightBooking.Users.Agent, as: UserAgent
FlightBooking.Users.Agent
iex(5)> alias FlightBooking.Bookings.Agent, as: BookingAgent  
FlightBooking.Bookings.Agent
iex(6)> UserAgent.start_link %{}
{:ok, #PID<0.270.0>}
iex(7)> UserAgent.save user
:ok
iex(8)> UserAgent.get "2aadf6d6-a857-4072-82b4-a984843000f8"
{:ok,
 %FlightBooking.Users.User{
   cpf: "1234423232",
   email: "vinicius@email",
   id: "2aadf6d6-a857-4072-82b4-a984843000f8",
   name: "vinicius"
 }}
iex(9)> {:ok, booking} = Booking.build(user, NaiveDateTime.utc_now, "aracaju", "sao paulo")
{:ok,
 %FlightBooking.Bookings.Booking{
   date: ~N[2021-08-01 22:36:25.348881],
   destination: "sao paulo",
   origin: "aracaju",
   user_id: "2aadf6d6-a857-4072-82b4-a984843000f8"
 }}
iex(10)> BookingAgent.start_link %{}
{:ok, #PID<0.276.0>}
iex(11)>  BookingAgent.save(booking)
{:ok, "9718fdc2-cd8b-4e71-9e68-dc669e9d68b6"}
iex(12)> BookingAgent.get_all
%{
  "9718fdc2-cd8b-4e71-9e68-dc669e9d68b6" => %FlightBooking.Bookings.Booking{
    date: ~N[2021-08-01 22:36:25.348881],
    destination: "sao paulo",
    origin: "aracaju",
    user_id: "2aadf6d6-a857-4072-82b4-a984843000f8"
  }
}
```

# Flight Booking

### O objetivo da aplicação é criar uma forma de reservar voos. Temos cadastro de usuário e cadastro de reserva de voo.


- Um exemplo de como testar o código locamente

```elixir
Compiling 1 file (.ex)
Interactive Elixir (1.11.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> alias FlightBooking.
Bookings                      MixProject                    
Users                         create_or_update_booking/1    
create_or_update_user/1       start_agents/0                

iex(1)> alias FlightBooking.Users.
Agent             CreateOrUpdate    User              
iex(1)> alias FlightBooking.Users.User
FlightBooking.Users.User
iex(2)> alias FlightBooking.Bookings.Booking
FlightBooking.Bookings.Booking
iex(3)> {:ok, user} = User.build(UUID.uuid4, "vinicius", "vinicius@email", "1234423232")
{:ok,
 %FlightBooking.Users.User{
   cpf: "1234423232",
   email: "vinicius@email",
   id: "348d93b5-5473-4f33-ab7a-fb27c3916c62",
   name: "vinicius"
 }}
iex(4)> user
%FlightBooking.Users.User{
  cpf: "1234423232",
  email: "vinicius@email",
  id: "348d93b5-5473-4f33-ab7a-fb27c3916c62",
  name: "vinicius"
}
iex(5)> alias FlightBooking.Users. 
Agent             CreateOrUpdate    User              
iex(5)> alias FlightBooking.Users.Agent, as: UserAgent
FlightBooking.Users.Agent
iex(6)> alias FlightBooking.Bookings., as: BookingAgent     
Agent             Booking           CreateOrUpdate    
iex(6)> alias FlightBooking.Bookings.Booking, as: BookingAgent
FlightBooking.Bookings.Booking
iex(7)> User
User         UserAgent    
iex(7)> UserAgent.
child_spec/1    get/1           get_all/0       save/1          
start_link/1    
iex(7)> UserAgent.start_link %{}
{:ok, #PID<0.222.0>}
iex(8)> UserAgent.save user
:ok
iex(9)> UserAgent.
child_spec/1    get/1           get_all/0       save/1          
start_link/1    
iex(9)> UserAgent.get "348d93b5-5473-4f33-ab7a-fb27c3916c62"
{:ok,
 %FlightBooking.Users.User{
   cpf: "1234423232",
   email: "vinicius@email",
   id: "348d93b5-5473-4f33-ab7a-fb27c3916c62",
   name: "vinicius"
 }}
iex(10)> {:ok, booking} = Booking.build("348d93b5-5473-4f33-ab7a-fb27c3916c62", NaiveDateTime.utc_now, "aracaju", "sao paulo")
** (MatchError) no match of right hand side value: {:error, "Invalid params"}

iex(10)> {:ok, booking} = Booking.build(user, NaiveDateTime.utc_now, "aracaju", "sao paulo")                                  
{:ok,
 %FlightBooking.Bookings.Booking{
   date: ~N[2021-08-01 22:07:57.923932],
   destination: "sao paulo",
   origin: "aracaju",
   user_id: "348d93b5-5473-4f33-ab7a-fb27c3916c62"
 }}
iex(11)> alias FlightBooking.Bookings.Agent, as: BookingAgent                                                                 
FlightBooking.Bookings.Agent
iex(12)> A
Access             Agent              Application        ArgumentError      
ArithmeticError    Atom               
iex(12)> BookingAgent.
child_spec/1    get/1           get_all/0       save/1          
start_link/1    
iex(12)> BookingAgent.start_link %{}
{:ok, #PID<0.231.0>}
iex(13)> BookingAgent.save(booking) 
{:ok, "e1c06db3-b6a6-43b8-bc02-901bf240ad54"}
iex(14)> BookingAgent.
child_spec/1    get/1           get_all/0       save/1          
start_link/1    
iex(14)> BookingAgent.get_all
%{
  "e1c06db3-b6a6-43b8-bc02-901bf240ad54" => %FlightBooking.Bookings.Booking{
    date: ~N[2021-08-01 22:07:57.923932],
    destination: "sao paulo",
    origin: "aracaju",
    user_id: "348d93b5-5473-4f33-ab7a-fb27c3916c62"
  }
} 
```

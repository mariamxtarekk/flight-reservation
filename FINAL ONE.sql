create database airline_reservation

                     ---CREATING TABLE---

create table passenger
(
userr_id int primary key, first_name varchar(50) not null,
last_name varchar(50) not null, nationality varchar(50) not null,  date_of_birth date,
age int, gender char(6) not null, mobile_no varchar(10) not null,
address varchar (50) null
)
 
create table ticket
 (
 ticket_no int primary key, flight_no int, gate varchar(10) not null,
 seat_no varchar(10) not null, class varchar(50) not null, 
 destination varchar(50) not null, date_time datetime, passenger_no int,
 constraint passenger_ticket_fk foreign key (passenger_no) references passenger (userr_id)
 )

 create table airline
 (
 airline_name varchar(50) not null primary key, contact_no varchar(50),
 )
 
create table flight
 (
 flight_no varchar(50) not null primary key,
 gate varchar(10) not null, arrival_time time, departure_time time,
 distance float(20), seat_available int, airline_flight_info varchar(50) not null,
 constraint airline_flight_fk foreign key (airline_flight_info) references airline (airline_name)
 )
 
 create table PassengerFlight
 (
 userr_id int,
 flight_no varchar (50) not null,
 constraint pk_userr_flight_id primary key (userr_id, flight_no),
 constraint fk_passenger foreign key (userr_id) references  passenger (userr_id),
 constraint fk_flight foreign key (flight_no) references  flight (flight_no)
 )

create table payment
 (
 transaction_id int primary key, payment_method char (10) not null,
 amount int, ticket_payment int,
 constraint ticket_payment_fk foreign key (ticket_payment) references ticket (ticket_no)
 )

                               
							   --INSERT--

--INSERTING DATA IN TABLE PASSENGER--

insert into passenger (userr_id, first_name, last_name, nationality, date_of_birth, age, gender, mobile_no, address)
values ('1', 'Lilian', 'Aziz', 'Egyptian', '2001-12-07', '21', 'Female', '012234', 'Hadayek El-Koba')

insert into passenger (userr_id, first_name, last_name, nationality, date_of_birth, age, gender, mobile_no, address)
values ('2', 'Yasmeen', 'Salama', 'Egyptian', '2000-11-02', '22', 'Female', '011247', 'Kobry El-Koba')

insert into passenger (userr_id, first_name, last_name, nationality, date_of_birth, age, gender, mobile_no, address)
values ('3', 'Mariam', 'Tarek', 'Egyptian', '2002-12-19', '20', 'Female', '010234', 'Hadayek El-Ahram')

insert into passenger (userr_id, first_name, last_name, nationality, date_of_birth, age, gender, mobile_no)
values ('4', 'Omar', 'Ahmed', 'Spanish', '1999-06-16', '23', 'Male', '015359')

insert into passenger (userr_id, first_name, last_name, nationality, date_of_birth, age, gender, mobile_no)
values ('5', 'Kirollos', 'Medhat', 'Argentinian', '2001-12-11', '21', 'Male', '011145')


update passenger set date_of_birth = '2000-11-21' where userr_id =2 


--INSERTING DATA IN TABLE TICKET--

Alter table ticket
Alter column flight_no varchar(10) not null;

insert into ticket (ticket_no, flight_no, gate, seat_no, class, destination, date_time, passenger_no)
values ('302', 'MS2700', 'A4', '40A', 'Economy', 'Italy', '2023-05-02 10:30', '1')

insert into ticket (ticket_no, flight_no, gate, seat_no, class, destination, date_time, passenger_no)
values ('208', 'QR1400', 'A1', '7F', 'First', 'Qatar', '2023-05-13 16:45', '3') 

insert into ticket (ticket_no, flight_no, gate, seat_no, class, destination, date_time, passenger_no)
values ('788', 'AF2210', 'B5', '10B', 'Business', 'Paris', '2023-11-11 00:00', '2')

insert into ticket (ticket_no, flight_no, gate, seat_no, class, destination, date_time, passenger_no)
values ('899', 'MS701', 'C4', '26D', 'Economy', 'Greece', '2023-07-21 13:05', '4')

insert into ticket (ticket_no, flight_no, gate, seat_no, class, destination, date_time, passenger_no)
values ('622', 'EK1243', 'D9', '15E', 'Business', 'Emirates', '2023-12-25 09:10', '5')

insert into ticket (ticket_no, flight_no, gate, seat_no, class, destination, date_time, passenger_no)
values ('128', 'IB3100', 'E8', '4A', 'First', 'Spain', '2023-09-11 20:45', '3')


--INSERTING DATA IN TABLE AIRLINE--

insert into airline (airline_name, contact_no)
values ('Qatar Airways' , '021998')

insert into airline (airline_name, contact_no)
values ('Egypt Air', '021968')

insert into airline (airline_name, contact_no)
values ('Air France', '021623')

insert into airline (airline_name, contact_no)
values ('Emirates Airlines', '021789')

insert into airline (airline_name, contact_no)
values ('Iberia Airlines', '021523')

--INSERTING DATE IN TABLE FLIGHT--

alter table flight
add destination varchar(50) not null

insert into flight (flight_no, gate ,destination, arrival_time, departure_time, distance, seat_available, airline_flight_info)
values ('MS2700','A4','ROMA','14:30','10:30','4100.1','120','Egypt Air' )

insert into flight (flight_no, gate ,destination, arrival_time, departure_time, distance, seat_available, airline_flight_info)
values ('QR1400','A1','DOHA','19:45','16:45','2643.2','160','QATAR Airways' )

insert into flight (flight_no, gate ,destination, arrival_time, departure_time, distance, seat_available, airline_flight_info)
values ('AF2210','B5','PARIS','04:00','00:00','5299.6','150','AIR FRANCE' )

insert into flight (flight_no, gate ,destination, arrival_time, departure_time, distance, seat_available, airline_flight_info)
values ('MS701','C4','ATHENA','14:30','13:05','1120','170','Egypt Air' )

insert into flight (flight_no, gate ,destination, arrival_time, departure_time, distance, seat_available, airline_flight_info)
values ('EK1243','D9','DUBAI','13:00','09:10','3115.4','200','Emirates Airlines' )

insert into flight (flight_no, gate ,destination, arrival_time, departure_time, distance, seat_available, airline_flight_info)
values ('IB3100','E8','MADRID','01:00','20:45','3354','150','Iberia Airlines' )


--INSERTING DATE IN TABLE PASSENGERFLIGHT--

insert into PassengerFlight ( userr_id , flight_no )
values ('1' , 'MS2700')
insert into PassengerFlight ( userr_id , flight_no )
values ('3' , 'QR1400')
insert into PassengerFlight ( userr_id , flight_no )
values ('2' , 'AF2210')
insert into PassengerFlight ( userr_id , flight_no )
values ('4' , 'MS701')
insert into PassengerFlight ( userr_id , flight_no )
values ('5' ,'EK1243' )
insert into PassengerFlight ( userr_id , flight_no )
values ('3' , 'IB3100')



--INSERTING DATA IN TABLE PAYMENT--
insert into payment (transaction_id , payment_method , amount , ticket_payment)
values ('24' ,'cash' , '7000' ,'302' )

insert into payment (transaction_id , payment_method , amount , ticket_payment)
values ('53' ,'visa' , '3800' , '208')

insert into payment (transaction_id , payment_method , amount , ticket_payment)
values ('67' ,'visa' , '12000' ,'788' )

insert into payment (transaction_id , payment_method , amount , ticket_payment)
values ('90' ,'cash' , '10000' ,'899' )

insert into payment (transaction_id , payment_method , amount , ticket_payment)
values ('85' ,'cash' , '7000' , '622')
 
 insert into payment (transaction_id , payment_method , amount , ticket_payment)
values ('36' ,'cash' , '14000' , '128')


                           --SELECT FROM TABLES--


select first_name , age from passenger

select distinct nationality from passenger
 
select * from ticket where class = 'Economy' 

select destination , airline_flight_info from flight 
where destination = 'ROMA' or airline_flight_info = 'Egypt Air'

select payment_method from payment where not payment_method = 'cash' 

select*from passenger order by age desc

select * from passenger where address is null

select max (amount) from payment 

select count(flight_no) as count_flight_no from PassengerFlight

Select first_name +','+ mobile_no as name_phone from passenger

select transaction_id from payment where amount between 8000 and 14000

select transaction_id from payment where amount not in (8000,14000)

select address from passenger where address like ('H%')

select last_name from passenger where last_name like ('_a%')

select COUNT (ticket_no) as number_of_tickets, passenger_no 
from ticket group by passenger_no ORDER BY count (ticket_no) asc

select min (distance) as distance_of_the_flight, airline_flight_info 
from flight group by airline_flight_info HAVING min (distance)<3000

                        --JOIN--

select flight.flight_no, airline.airline_name from flight INNER join 
airline on airline.airline_name = flight.airline_flight_info



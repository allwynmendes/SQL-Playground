--Customers
insert into customer values(1, 'Shiwani', '8109773714', 'agrawalshiwani30@gmail.com', 'F', 25);
insert into customer values(2, 'Priya', '9702499793', 'priya.tawar25@gmail.com', 'F', 25);

--Customer_login
insert into customer_login values(1, 'shiwani', 'shiwani123');
insert into customer_login values(2, 'priya', 'priya123');

/*------------------------TRIGGER----------------------------*/
/*
This trigger updates the number of seats in bus_trip table
based on inserts into ticket table
*/
create or replace trigger update_seats
after insert on ticket
for each row
declare
    tripid number;
    seats_avail number;
begin
    update bus_trip set seats_available = seats_available - :new.no_of_tickets;
    select trip_id, seats_available into tripid, seats_avail from bus_trip;
    dbms_output.put_line('Trip Id          : '||tripid);
    dbms_output.put_line('Seates Available : '||seats_avail);
end;
/

--Ticket
insert into ticket values(1, 1, 2, 3, 5, 400, 2);

--Passengers
insert into passengers values(1, 'Priya', 'F', 25, 5);
insert into passengers values(1, 'Shiwani', 'F', 25, 6);

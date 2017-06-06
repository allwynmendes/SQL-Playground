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

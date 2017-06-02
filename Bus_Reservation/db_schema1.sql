--This file contains schema for bus reservation system

--Location Tables
create table states(
    state_id varchar2(2),
    state_name varchar2(30),
    primary key(state_id)
);

create table location(
    location_id number(3),
    location_name varchar2(30),
    state_id varchar2(2),
    primary key(location_id),
    foreign key(state_id) references states(state_id)
);

create table sub_location(
    slocation_id number(4),
    slocation_name varchar2(30),
    location_id number(3),
    primary key(slocation_id),
    foreign key(location_id) references location(location_id)
);

--Bus Information

create table bus_company(
    company_id number(10),
    company_name varchar2(50),
    password varchar2(50),
    primary key (company_id)
);

create table buses(
    bus_number varchar2(20),
    seats number(2),
    ac char(1),
    seat_type varchar2(15),
    primary key (bus_number)
);    

create table bus_location(
    bus_number varchar2(20),
    coordinates varchar2(100),
    last_updated timestamp,
    foreign key(bus_number) references buses(bus_number)
);   

create table bus_ownres(
    company_id number(10),
    bus_number varchar2(20),
    foreign key(company_id) references bus_company(company_id),
    foreign key(bus_number) references buses(bus_number)
);    

create table bus_trip(
    trip_id number(10),
    company_id number(10),
    bus_number varchar2(10),
    date_time timestamp,
    from_dest varchar2(15),
    to_dest varchar2(15),
    price number(10,2),
    seats_available number(2),
    primary key(trip_id),
    foreign key(company_id) references bus_company(company_id),
    foreign key(bus_number) references buses(bus_number)
);    

create table bus_stops(
    trip_id number(10),
    stop_location number(10),
    stop_order number(10),
    primary key (stop_location),
    foreign key(trip_id) references bus_trip(trip_id)
);

Hi Priya     

--This file contains schema for bus reservation system

--Location Tables
create table states(
    state_id varchar2(2),
    state_name varchar2(30),
    primary key(state_id)
);

create table location(
    location_id varchar2(2),
    state_id varchar2(2),
    location_name varchar2(30),
    primary key(location_id, state_id),
    foreign key(state_id) references states(state_id) on delete cascade
);

create table sub_location(
    slocation_id number(4),
    slocation_name varchar2(30),
    location_id varchar2(4),
    primary key(slocation_id)
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

--Customer Information

create table customer(
    customer_id number(10),
    customer_name varchar2(20),
    customer_phnno number(10),
    customer_email varchar2(30),
    gender varchar2(10),
    age number(10),
    primary key(customer_id),
    unique (customer_phnno),
    unique (customer_email)
);    
    
create table ticket(
    ticket_id number(10),
    trip_id number(10),
    customer_id number(10),
    pickup_location number(15),
    drop_location number(15),
    price number(10,2),
    no_of_tickets number(10),
    primary key(ticket_id),
    foreign key(trip_id) references bus_trip(trip_id),
    foreign key(customer_id) references customer(customer_id),
    foreign key(pickup_location) references sub_location(slocation_id),
    foreign key(drop_location) references sub_location(slocation_id)
);

create table payment_details(
    ticket_id number(10),
    mode_of_payment varchar2(15),
    payment_status varchar2(15),
    foreign key(ticket_id) references ticket(ticket_id)
);

create table customer_login(
    customer_id number(10),
    username varchar(20),
    password varchar(20),
    foreign key (customer_id) references customer(customer_id)
);

create table passengers(
    ticket_id number(10),
    passenger_name varchar(100),
    gender char(1),
    age number(3),
    seat_number number(2),
    foreign key(ticket_id) references ticket(ticket_id)
);

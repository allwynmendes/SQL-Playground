--This file contains schema for bus reservation system

--Tables related to locationing for buses (state-location-sublocation)
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

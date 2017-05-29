--create table structure for planets
create or replace table planets(
    id number primary key,
    name varchar2(15),
    distance number(10, 2),
    radius number(10, 2),
    gravity number(10, 2)
);

--Insert data into planets
insert into planets values (0, 'Sun', 0, 695700, 274);
insert into planets values (1, 'Mercury', 57.9, 2439, 3.7);
insert into planets values (2, 'Venus', 108.2, 6052, 8.87);
insert into planets values (3, 'Earth', 149.6, 6378, 9.798);
insert into planets values (4, 'Mars', 227.9, 3393.5, 3.71);

insert into planets values (5, 'Jupiter', 778.3, 71398, 24.92);
insert into planets values (6, 'Saturn', 1427, 60330, 10.44);
insert into planets values (7, 'Uranus', 2871, 25559, 8.69);
insert into planets values (8, 'Neptune', 4497.1, 24300, 11.15);
insert into planets values (9, 'Pluto', 5913, 1137, 0.58);

--get all information about table 'planets'
select * from planets;

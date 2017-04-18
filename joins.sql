create table sd(
  dno number,
  dname varchar2(10),
  loc_id number references locations_1(loc_id)
);

create table locations_1(
  loc_id number primary key,
  city varchar2(10)
);

insert into locations_1 values (10, 'Mapusa');
insert into locations_1 values (20, 'Pune');
insert into locations_1 values (30, 'Lavasa');
insert into locations_1 values (40, 'Panjim');
select * from locations_1;

insert into sd values (1, 'Sales', 10);
insert into sd values (2, 'Research', 30);
insert into sd values (3, 'Accounts', 10);
insert into sd values (4, 'IT', 40);
select * from sd;

select s.*, l.* from sd s left outer join locations_1 l on s.loc_id = l.loc_id;
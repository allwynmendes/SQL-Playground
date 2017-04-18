/*
Uday Sir Notes on 30/01/2017 :
The Note was that using set operators (specially union, union all) 
on tables that have primary keys will result in error
due to ambiguity.

Code below demonstrates no such issue.
*/

create table temp1(
  t1 number,
  t2 varchar2(10)
);

create table temp2(
  t1 number,
  t2 varchar2(10)
);

insert into temp1 values(1, 'A');
insert into temp1 values(2, 'B');
insert into temp1 values(3, 'C');
insert into temp1 values(6, 'F');
insert into temp1 values(7, 'G');

insert into temp2 values(1, 'A');
insert into temp2 values(2, 'B');
insert into temp2 values(4, 'D');
insert into temp2 values(5, 'E');

alter table temp1
add primary key(t1);

alter table temp2
add primary key(t1);

desc temp1; 
desc temp2;

select * from temp1;
select * from temp2;

select * from temp1 union all select * from temp2;

/*
Uday Sir Notes on 30/01/2017 :
The Note was that using set operators (specially union, union all) 
on tables that have primary keys will result in error
due to ambiguity
*/
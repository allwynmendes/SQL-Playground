--Triggers

select * from emp;

create table emp(
    id number,
    ename varchar(20),
    ejob varchar(20),
    esal number(7,2),
    constraint emp_id_pk primary key(id)
);

create sequence s1
start with 1
increment by 2
minvalue 1
cache 20;

insert into emp values(s1.nextval, 'A', 'CEO', 10000);
insert into emp values(s1.nextval, 'B', 'Developer', 8000);
insert into emp values(s1.nextval, 'C', 'Tester', 7500);
insert into emp values(s1.nextval, 'D', 'Database', 7750);
insert into emp values(s1.nextval, 'E', 'Dev-Ops', 6000);

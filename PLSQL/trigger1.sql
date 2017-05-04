--Triggers
set serveroutput on;
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

--Here, Creating triggers and tables to dump triggered values into

create table emp_update_dump(
    id references emp(id),
    ename varchar(20),
    old_sal number(7,2),
    new_sal number(7,2),
    user1 varchar(20),
    date1 date
);

create or replace trigger emp_tr1
before update on emp
for each row
DECLARE
    sal_diff number(7,2);
BEGIN
    sal_diff := :new.esal - :old.esal;
    dbms_output.put_line('Old Salary : '||:old.esal);
    dbms_output.put_line('New Salary : '||:new.esal);
    dbms_output.put_line('Salary Diff : '||sal_diff);
    if (:old.esal < :new.esal) then
        dbms_output.put_line('Salary Increase');
    else
        dbms_output.put_line('Salary Decrease');
    end if;
END;

show error;

update emp set esal=10000;

create table dd(
  id number(3),
  nm varchar2(15)
);

create sequence s1
start with 2
increment by 5
maxvalue 20
cycle
cache 3;

insert into dd values(s1.nextval, 'A');
insert into dd values(s1.nextval, 'B');
insert into dd values(s1.nextval, 'C');
insert into dd values(s1.nextval, 'D');
insert into dd values(s1.nextval, 'E');
insert into dd values(s1.nextval, 'F');
insert into dd values(s1.nextval, 'G');
insert into dd values(s1.nextval, 'H');

select * from dd; 

drop table dd;
drop sequence s1;
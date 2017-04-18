select * from tab;

create table t_emp(
  eno number,
  ename varchar(20),
  jobtitle varchar(20),
  manager number,
  c_status varchar(10)
);

create table s_emp(
  eno number,
  ename varchar(20)
);

insert into s_emp(eno, ename) values(1, 'A');
insert into s_emp(eno, ename) values(2, 'B');
insert into s_emp(eno, ename) values(3, 'C');
insert into s_emp(eno, ename) values(4, 'D');
insert into s_emp(eno, ename) values(5, 'E');

insert into t_emp (eno, ename, jobtitle, manager) values(1, 'A', 'Developer', '2');
insert into t_emp (eno, ename, jobtitle, manager) values(2, 'A2', 'Developer', '2');
insert into t_emp (eno, ename, jobtitle, manager) values(3, 'C', 'Developer', '2');
insert into t_emp (eno, ename, jobtitle, manager) values(4, 'D', 'Developer', '2');
insert into t_emp (eno, ename, jobtitle, manager) values(5, 'A5', 'Developer', '2');

merge into t_emp t using s_emp s on (t.eno=s.eno)
when matched then
update set t.ename = s.ename
when not matched then
insert (t.eno, t.ename, t.c_status) values (10, s.ename, 'WHEN-NOT');

select * from t_emp;
select * from s_emp;

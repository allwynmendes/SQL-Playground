
set serveroutput on

declare 
sn number(3);
nm varchar2(15);
gk number(3);
sn1 number(4);
ename varchar2(10);

begin
sn:=12;
nm:='Uday';
gk:=90;
select empno, ename into sn1, ename from ee
where empno=7566;
dbms_output.put_line(sn ||'   '||nm ||'  '||gk);
dbms_output.put_line(sn1 ||'   '||ename);
end

declare
a number := 10;
b number(3) := 20;
c number;
begin
c := a+b;
dbms_output.put_line('Addition od a and b is'||c);
end;

select * from ee;

set serveroutput on;

begin
dbms_output.put_line('Hello');
end;

declare 
a number(2);
b number(2);
c number;
begin
a:=90;
b:=20;
c:=a+b;
dbms_output.put_line(c);
end;

select empno, ename from ee 
where empno=7566;

declare 
eno number(5);
ename varchar2(15);
begin
select empno, ename into eno, ename from ee where empno=7566;
dbms_output.put_line('Employee Number: '||eno);
dbms_output.put_line('Employee Name: '||ename);
end;

declare 
a number(2);
b number(2);
c number;
begin
a:=90;
b:=0;
dbms_output.put_line('Division Is:'||a/b);
Exception
    when ZERO_DIVIDE then
        dbms_output.put_line( SQLERRM);
        dbms_output.put_line(SQLCODE);
end;

declare 
eno number;
begin
eno := &no;

delete from ee
where empno = eno;

insert into ee values(2001,'BBB','CLERK',7782,'09-Aug-2012',1500,null,20,'F');

commit;

end;


select * from ee;

begin

insert into df values(1);
insert into df values(2);
insert into df values(3);
insert into df values(4);

commit;

end;

--get the details of emp id 7566;

declare
eno ee.empno%type;
enm ee.ename%type;
esal ee.sal%type;
ejob ee.job%type;

begin
eno:=&eno;

select ename, sal, job into enm, esal,ejob from ee
where empno = eno;
dbms_output.put_line('---------------------------');
dbms_output.put_line('Employeee Number:'|| eno);
dbms_output.put_line('---------------------------');
 dbms_output.put_line('Employeee Name:'|| enm);
 dbms_output.put_line('Employeee Salary:'|| esal);
 dbms_output.put_line('Employeee Job:'|| ejob);
 dbms_output.put_line('---------------------------');
 end;
 
 select * from ee;
 
 set serveroutput on

declare
eno ee.empno%type;
emprec ee%rowtype;

begin
eno:=&eno;
select * into emprec from ee
where empno = eno;
dbms_output.put_line('---------------------------');
dbms_output.put_line('Employeee Number:'|| eno);
dbms_output.put_line('---------------------------');
 dbms_output.put_line('Employeee Name:'|| emprec.ename);
 dbms_output.put_line('Employeee Salary:'|| emprec.sal);
 dbms_output.put_line('Employeee Job:'|| emprec.job);
 dbms_output.put_line('Employeee Manager ID:'|| emprec.mgr);
 dbms_output.put_line('Employeee Hire Date:'|| emprec.hiredate);
 dbms_output.put_line('Employeee Commition:'|| emprec.comm);
 dbms_output.put_line('Employeee Department Number:'|| emprec.deptno);
 dbms_output.put_line('---------------------------');
 end;

declare
no ee.empno%type;
type emptype is record
(
    eno ee.empno%type,
    enm ee.ename%type,
    ejob ee.job%type,
    esal ee.sal%type
);
emprec emptype;

begin
no :=&no;
select empno, ename, job,sal into  emprec from ee
where empno=no;

dbms_output.put_line('---------------------------');
dbms_output.put_line('Employeee Number:'|| no);
dbms_output.put_line('---------------------------');
 dbms_output.put_line('Employeee Name:'|| emprec.enm);
 dbms_output.put_line('Employeee Salary:'|| emprec.esal);
 dbms_output.put_line('Employeee Job:'|| emprec.ejob);
 dbms_output.put_line('---------------------------');
 end;
 
 
 declare
no ee.empno%type;
type emp_dept_type is record
(
    eno ee.empno%type,
    enm ee.ename%type,
    ejob ee.job%type,
    esal ee.sal%type,
    dno dept.deptno%type,
    dnm dept.dname%type
);
emprec emp_dept_type;

begin
no :=&no;
select e1.empno, e1.ename, e1.job, e1.sal, d1.deptno, d1.dname into 
 emprec from ee e1, dept d1
where e1.empno=no
and e1.deptno=d1.deptno;

dbms_output.put_line('---------------------------');
dbms_output.put_line('Employeee Number:'|| no);
dbms_output.put_line('---------------------------');
 dbms_output.put_line('Employeee Name:'|| emprec.enm);
 dbms_output.put_line('Employeee Salary:'|| emprec.esal);
 dbms_output.put_line('Employeee Job:'|| emprec.ejob);
 dbms_output.put_line('Employeee Department Number:'|| emprec.dno);
 dbms_output.put_line('Employeee Department Name:'|| emprec.dnm);
  dbms_output.put_line('---------------------------');
 end; 
 
 
 create table naya
 (
 no number,
 nm varchar(10)
 );
 
 insert into naya values(1,'UDAY');
 insert into naya values(2,'Mahesh');
 insert into naya values(3,'Pravin');
 insert into naya values(4,'Javed');
 
 commit;
 
 
declare
eno naya.no%type;
emprec naya%rowtype;

begin
eno:=&eno;
select * into emprec from naya
where no = eno;
dbms_output.put_line('---------------------------');
dbms_output.put_line('Employeee Number:'|| eno);
dbms_output.put_line('---------------------------');
 dbms_output.put_line('Employeee Name:'|| emprec.nm);
dbms_output.put_line('---------------------------');
end; 

select * from ee;

select distinct(e2.sal) from ee e1, ee e2
where 2 = (select count(distinct(e1.sal)) from ee e1
where e2.sal<=e1.sal);

select * from ( select ee.*, dense_rank() over(order by sal desc) as
 RNK from ee ) where RNK=3;
 
 select min(sal) from (select sal from ee order by sal desc) where rownum<3;
 
 select * from ee;
 
declare
e_sal number(8,2);
e_ID number(6) := 7499;
begin
select sal into e_sal from emp
where empno=e_ID;
dbms_output.put_line(e_sal);
dbms_output.put_line('The Salary Of'||e_ID||'Is: '||e_sal);
end;

declare
e_S number(4);
e_I number(6);
begin
e_S :=100;
e_I :=200;
declare
e_II number(6);
begin
e_II :=400;
dbms_output.put_line(e_S);
dbms_output.put_line(e_I);
dbms_output.put_line(e_II);
e_II :=e_S;
dbms_output.put_line(e_II);
end;
end;


select * from emp;

desc uday_test;


declare 
type test_rec is record
(t_eno number(4),
t_ename uday_test.ename%type,
t_sal uday_test.sal%type,
t_jn_dt date,
t_lname varchar2(15));
test_rec1 test_rec; 

abc test_rec1.t_eno;
pqr test_rec1.t_ename;

begin 
select * into test_rec1 from uday_test
where eno=2;

dbms_output.put_line(abc);
dbms_output.put_line(pqr);

end;

select * from uday_test

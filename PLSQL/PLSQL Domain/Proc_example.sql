create or replace procedure prc1(pdno number) is
sum_sal number;
begin
select  sum(sal) into sum_sal from emp
where deptno=pdno;
dbms_output.put_line('Total Sal Is:'||sum_sal);
end;

create or replace procedure prc2(pdno number) is
avg_sal number;
begin
select  avg(sal) into avg_sal from emp
where deptno=pdno;
dbms_output.put_line('AVERAGE Sal Is:'||avg_sal);
end;

create or replace procedure prc3(pdno number) is
max_sal number;
begin
select  max(sal) into max_sal from emp
where deptno=pdno;
dbms_output.put_line('Maximum Sal Is:'||max_sal);
end;

create or replace procedure prc4(pdno number) is
min_sal number;
begin
select  min(sal) into min_sal from emp
where deptno=pdno;
dbms_output.put_line('Minimum Sal Is:'||min_sal);
end;

create or replace procedure prc_call(dno number) is
begin
dbms_output.put_line('Procedure Call Process Begins');
prc1(dno);
prc2(dno);
prc3(dno);
prc4(dno);
dbms_output.put_line('Procedure Call Process Ends');
end;

declare
no number;
begin
no:=&no;
prc_call(no);
end;

set serveroutput on;

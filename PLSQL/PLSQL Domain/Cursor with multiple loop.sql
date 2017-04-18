set serveroutput on

declare
cursor c1 (ere c emp%rowtype) is
select * from emp
where job=erec.job and deptno = erec.deptno;
emprec emp%rowtype;
begin
    select * into emprec from emp
    where ename = 'MARTIN';
    for x in c1(emprec) loop
    dbms_output.put_line('Ename:'||x.ename);
    dbms_output.put_line('Job:'||x.job);
    dbms_output.put_line('Salary:'||x.sal);
    end loop;
    
end;


declare
cursor c1 is
select * from emp;
cursor c2 is
select * from dept;
begin
for x in c2 loop
    dbms_output.put_line('Department Name:'||x.dname);
    for y in c1 loop
        if x.deptno = y.deptno then
            dbms_output.put_line('Employee Name:'||y.ename);
        end if;
    end loop;
end loop;
end;      

declare
cursor c1(pdeptno number)is
select * from emp
where deptno = pdeptno;
cursor c2 is
select * from dept;
begin
for x in c2 loop
    dbms_output.put_line('Department Name:'||x.dname);
    for y in c1(x.deptno) loop
        dbms_output.put_line('Employee Name:'||y.ename);
    end loop;
end loop;
end;      

  
set serveroutput on

declare
cursor c1 is
select * from emp;
er emp%rowtype;
begin
open c1;
for x in 1..15 loop
fetch c1 into er;
    dbms_output.put_line('Name Is:'||er.ename);
    dbms_output.put_line('Job Is:'||er.job);
    dbms_output.put_line('Salary Is:'||er.sal);
end loop;
close c1;
end;

declare
cursor c1 is
select * from emp;
er emp%rowtype;
begin

open c1;
for x in 1..15 loop
fetch c1 into er;
    dbms_output.put_line('Name Is:'||er.ename||'  '||'Job Is:'||er.job||'  '||'Salary Is:'||er.sal);
    -- dbms_output.put_line('Job Is:'||er.job);
    -- dbms_output.put_line('Salary Is:'||er.sal);
end loop;
close c1;
end;

declare 
cursor c1 is
select * from emp;
er emp%rowtype;
vc number:=0;
begin
select count(*) into vc from ee;
dbms_output.put_line('Count Is:'||vc);
open c1;
for x in 1..vc loop
fetch c1 into er;
    dbms_output.put_line('Name Is:'||er.ename||'  '||'Job Is:'||er.job||'  '||'Salary Is:'||er.sal);
    -- dbms_output.put_line('Job Is:'||er.job);
    -- dbms_output.put_line('Salary Is:'||er.sal);
end loop;
close c1;
end;


 rollback;
 
 declare 
 cursor c2 is
 select * from ee where deptno=&dno;
 
 er ee%rowtype;
 begin
 open c2;
 loop
    fetch c2 into er;
    exit when c2%NOTFOUND ;
        dbms_output.put_line('Name Is:'||er.ename||'  '||'Job Is:'||er.job);
 end loop;
 close c2;
 end;
 
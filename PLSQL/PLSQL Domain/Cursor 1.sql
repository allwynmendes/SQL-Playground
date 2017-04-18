declare
cursor c1 is
select d.deptno, e.empno, e.ename, e.sal from emp e, dept d 
where e.deptno = d.deptno
and d.deptno=20 
for update of sal nowait; 

begin
for x in c1 loop
        if x.sal<5000 then
            update emp
            set sal=x.sal+x.sal*0.25 where current of c1;
            commit;
        end if;
end loop;
end;

ROLLBACK;

SELECT * FROM EMP
WHERE DEPTNO=20;

select * from emp
where job = 'CLERK'
for update;
commit;

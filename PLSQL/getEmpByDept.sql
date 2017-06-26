/*
This PLSQL code obtains Employees by department using two cursors.
One is a normal explicit cursor and the other cursor is a parameterized cusror
*/

DECLARE
    cursor c1 is select * from dept;
    cursor c2(dno dept.deptno%type) is select * from emp where deptno = dno;
    emprec emp%rowtype;
    --e1 emprec;
BEGIN
    for x in c1 loop
        open c2(x.deptno);
        loop
            fetch c2 into emprec;
            dbms_output.put_line(emprec.ename||' '||emprec.deptno);
            exit when c2%notfound;
        end loop;
        dbms_output.put_line('---');
        close c2;
    end loop;
END;


select * from emp;

select * from dept;

/*
The following lines of code demonstrates
the use of cursors.
Cursors are of two types :
  1)Implicit
  2)Explicit
*/

--Implicit
DECLARE
    total_rows number;
BEGIN
    select count(*) into total_rows from emp;
    if sql%found then       --Making use of sql%found 
        dbms_output.put_line('Found');
        dbms_output.put_line('Total Rows : '||total_rows); 
    elsif sql%notfound then
        dbms_output.put_line('Not Found');
    end if;
END;

DECLARE
    fname emp.ename%type;
BEGIN
    select ename into fname from emp where empno=7839;
    if sql%found then
        dbms_output.put_line('Found');
        dbms_output.put_line('Name : '||fname); 
    elsif sql%notfound then     
        dbms_output.put_line('Not Found');  --In case of Not Found, compiler raises an exception
    end if;
END;

--Implicit - use of sql%rowcount
BEGIN
    update emp set job='MGR' where job='MANAGER';
    dbms_output.put_line(sql%rowcount);
END;


--Explicit Cursor
DECLARE 
    cursor c1 is select * from emp; --declate
    rec1 c1%rowtype;
BEGIN
    open c1;  --open
    loop
        fetch c1 into rec1; --fetch
        dbms_output.put_line(rec1.ename);
        exit when c1%notfound;
    end loop;
    dbms_output.put_line(sql%rowcount);
    close c1; --close
END;

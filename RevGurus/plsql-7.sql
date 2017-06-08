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

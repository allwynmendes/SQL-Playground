/*
Code below demonstrates the use of select into in PLSQL.
And says Hi to the President of the organization
*/

DECLARE 
    var1 varchar2(10);
BEGIN
    select ename into var1 from emp where job = 'PRESIDENT';
    dbms_output.put_line('H1 '||var1||' !');
END;

--The same using %type
DECLARE 
    var1 emp.ename%type;    --use of %type
BEGIN
    select ename into var1 from emp where job = 'PRESIDENT';
    dbms_output.put_line('H1 '||var1||' !');
END;

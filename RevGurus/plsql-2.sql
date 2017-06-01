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
    var2 emp.sal%type;
BEGIN
    select ename, sal into var1, var2 from emp where job = 'PRESIDENT';
    dbms_output.put_line('H1 '||var1||' !');
    dbms_output.put_line('Your salary is '||var2);
END;

--Similar thing using %rowtype
DECLARE 
    var1 emp%rowtype;
BEGIN
    select * into var1 from emp where job = 'PRESIDENT';
    dbms_output.put_line('EMPNO : '||var1.empno);
    dbms_output.put_line('NAME  : '||var1.ename);
    dbms_output.put_line('JOB   : '||var1.job);
    dbms_output.put_line('SAL   : '||var1.sal);
END;

--Similar code using assignment operator(:=)
DECLARE 
    vempno emp.empno%type := 7566;
    var1 emp.ename%type;
    var2 emp.sal%type;
BEGIN
    --vempno := 7782;
    select ename, sal into var1, var2 from emp where empno = vempno;
    dbms_output.put_line('H1 '||var1||' !');
    dbms_output.put_line('Your salary is '||var2);
END;

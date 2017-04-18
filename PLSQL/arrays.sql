/*PLSQL - ARRAY*/

set serveroutput on;

/*Simple PLSQL code demonstrating Array*/
DECLARE
    type namesarray is varray(5) of varchar2(10);
    type grades is varray(5) of integer;
    names namesarray;
    marks grades;
    total integer;
BEGIN
    names := namesarray('A', 'B', 'C', 'D', 'E');
    marks := grades(10, 20, 30, 40, 50);
    total := names.count;
    dbms_output.put_line('Total : ' || total);
    for i in 1..total loop
        dbms_output.put_line('Student : '|| names(i)||' Marks : '|| marks(i));
    end loop;

END;

/*Array Experimentation with employee table*/
select * from employees;
desc employees;

DECLARE 
    cursor c1 is select first_name, salary from employees where employee_id between 100 and 110;
    type emp_name is varray(15) of employees.first_name%type;
    type emp_sal is varray(15) of employees.salary%type;
    ename emp_name := emp_name(); --Important to declare the array like this
    esal emp_sal := emp_sal();
    counter integer := 0;
BEGIN
    for x in c1 loop
        counter := counter + 1;
        ename.extend;   --Note : Without extend, it will not work
        esal.extend;
        ename(counter) := x.first_name;
        esal(counter) := x.salary;
    end loop;
    
    for i in 1..counter loop
        dbms_output.put_line('FirstName : ' || ename(i));
        dbms_output.put_line('Salary    : ' || esal(i));
        dbms_output.put_line(' ');
    end loop;
END;

set serveroutput on;

--Code to display employees whoes salary is between 3000 and 5000
DECLARE
    procedure pr1 is
        cursor c1 is select * from employees where salary between 3000 and 5000;
    begin
        for x in c1 loop
            dbms_output.put_line(x.first_name||' '||x.salary);
        end loop;
    end pr1; 
BEGIN
    pr1;
END;

--Code to Do Associative Array stuff
DECLARE
    cursor c1 is select first_name from employees where salary>10000;
    TYPE e_list IS TABLE OF employees.first_name%type INDEX BY binary_integer;
    names e_list;
    counter number := 0;
BEGIN
    for x in c1 loop
        counter := counter + 1;
        names(counter) := x.first_name;
        dbms_output.put_line(names(counter));
    end loop;

END;

--Nested Table to store names and grades of students

DECLARE
    TYPE names_list is TABLE OF varchar(2);
    TYPE grades is TABLE OF number;
    names names_list;
    marks grades;
    total number;
BEGIN
    names := names_list('A', 'B', 'C', 'D', 'E');
    marks := grades(10, 20, 30, 40, 50);
    total := names.count;
    dbms_output.put_line('Total Students : '||total);
    for i in 1..total loop
        dbms_output.put_line('Student :'||names(i)||'Grades : '||marks(i));
    end loop;

END;
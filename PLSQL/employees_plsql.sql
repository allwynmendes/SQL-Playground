set serveroutput on;

--Code to display employees whoes salary is between 3000 and 5000
DECLARE
    procedure pr1 is
        cursor c1 is select * from employees where salary between 3000 and 5000;
    begin
        for x in c1 loop
            dbms_output.put_line(x.first_name);
        end loop;
    end pr1;
BEGIN
    pr1;
END;
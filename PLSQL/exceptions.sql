/*In PLSQL there are two classes of exceptions : 
    1)Pre Defined
    2)User Defined
*/

set serveroutput on;

select * from employees;


declare
    ename employees.first_name%type;
    esal employees.salary%type;
begin
        select first_name, salary into ename, esal from employees where employee_id = &empid;
        dbms_output.put_line('Name   : '||ename);
        dbms_output.put_line('Salary : '||esal);
exception 
    when no_data_found then
        dbms_output.put_line('No such customer');
    when others then
        dbms_output.put_line('Error !!!');
end;
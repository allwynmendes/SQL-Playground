/*In PLSQL there are two classes of exceptions : 
    1)Pre Defined
    2)User Defined
*/

set serveroutput on;

select * from employees;

--Program to raise runtime exception NO_DATA_FOUND which is captured in exception block automatically
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

select * from employees;

--Raising Exceptions explicitly using RAISE command (TAX Eligibility)
DECLARE
    tax_exp exception; --declare an expeption type
    esal employees.salary%type;
BEGIN
    select salary into esal from employees where employee_id=&empid;
    dbms_output.put_line('Salary : '||esal);
    if esal > 10000 then
        RAISE tax_exp;
    else
        dbms_output.put_line('Tax on Income : 0%');
    end if;
EXCEPTION
    when tax_exp then
        dbms_output.put_line('Error : Tax eligible on income.');
    when others then
        dbms_output.put_line('Error !!!');
END;

/*Write code to implement : raise_application_error(-20000, 'Message Here')
                         to raise_application_error(20999, 'Message Here')
*/
--Action:   Use an error number in the range of -20000 to -20999, inclusive.
DECLARE
    x exception;
    a number;
    b number;
    c number;
BEGIN
    a := 10;
    b := 120;
    c := a + b;
    --select employee_id into a from employees;  --This line is used to test for SQLERRM
    if(c < 100) then
        dbms_output.put_line('c is valid');
    else
        raise x;
    end if;
EXCEPTION 
    when x then
        raise_application_error(-20001, 'c is invalid, should be less than 100');
    when others then
        dbms_output.put_line('Error : '||SQLERRM);
END;



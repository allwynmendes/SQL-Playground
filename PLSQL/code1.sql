
/*Explicit Variable*/
set serveroutput on;
DECLARE 
  var1 number;
BEGIN
  dbms_output.put_line('------------------------------------------');
  var1 := &var1;
  dbms_output.put_line('Number entered is ' || var1);
END;

select * from employees;

/*Implicit (Dynamic) Variable*/
set serveroutput on;
DECLARE 
  fname employees.first_name%type;
  lname employees.last_name%type;
  sal employees.salary%type;
BEGIN
  select first_name, last_name, salary into fname, lname, sal from employees where employee_id = 103;
  dbms_output.put_line('First Name : ' || fname);
  dbms_output.put_line('Last Name  : ' || lname);
  dbms_output.put_line('Salary     : ' || sal);
END;

/*Table Based Record*/
set serveroutput on;
DECLARE 
  emprow employees%rowtype;
BEGIN
  select * into emprow from employees where employee_id = 103;
  dbms_output.put_line('First Name : ' || emprow.first_name);
  dbms_output.put_line('Last Name  : ' || emprow.last_name);
  dbms_output.put_line('Salary     : ' || emprow.salary);
END;

/*User Defined Record*/
set serveroutput on;
DECLARE
  TYPE emptype IS RECORD(
    enm employees.first_name%type,
    esal employees.salary%type,
    ejob employees.job_id%type
  );
  
  emprec emptype;
BEGIN
  select first_name, salary, job_id into emprec.enm, emprec.esal, emprec.ejob from employees where employee_id=103; 
  dbms_output.put_line('Firstname : ' || emprec.enm);
  dbms_output.put_line('Salary    : ' || emprec.esal);
  dbms_output.put_line('Job       : ' || emprec.ejob);
END;
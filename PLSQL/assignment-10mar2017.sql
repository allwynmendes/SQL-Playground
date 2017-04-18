select * from employees;
select * from departments;
select * from locations;

select * from employees where first_name='Alexander';

set serveroutput on;
DECLARE
  TYPE emptype IS RECORD(
    job employees.job_id%type,
    sal employees.salary%type,
    deptno employees.department_id%type,
    deptnm departments.department_name%type,
    loc locations.city%type
  );
  emprec emptype;
  name1 employees.first_name%type;
BEGIN
  name1 := 'Lex';
  select job_id into emprec.job from employees where first_name=name1;
  dbms_output.put_line('JOB : ' || emprec.job);
END;

/*Q2. Calculate radius of circle*/
set serveroutput on;
DECLARE
  radius number(5,2);
  area number(5,2);
BEGIN
  radius := &radius;
  area := (22/7)*radius*radius;
  dbms_output.put_line('Radius : ' || area);
END;

/* Q3. Find greatest and smallest of 3 numbers*/
set serveroutput on;
DECLARE
  n1 number;
  n2 number;
  n3 number;
BEGIN
  n1 := 1;
  n2 := 2;
  n3 := 3;
  dbms_output.put_line('Greatest : ' || greatest(n1,n2,n3));
  dbms_output.put_line('Smallest : ' || least(n1,n2,n3));
END;

/*Q4. Read 2 integers from users and find :
  sum, diff, mult, div, mod, integer division,
  square, cube, sqrt, cube root*/
set serveroutput on;
DECLARE
  n1 number;
  n2 number;
  ans number;
BEGIN
  n1 :=25;
  n2 :=10;
  ans := n1 + n2;
  dbms_output.put_line('Sum : ' || ans);
  dbms_output.put_line('Difference : '|| (n1-n2));
  dbms_output.put_line('Multiplication : ' || n1*n2);
  dbms_output.put_line('Division : ' || n1/n2);
  dbms_output.put_line('Modulus : ' || mod(n1,n2));
  dbms_output.put_line('Integer Division : ' || trunc(n1/n2));
  dbms_output.put_line('Square : ' || power(n1, 2));
  dbms_output.put_line('Cube : ' || power(n1, 3));
  dbms_output.put_line('Sqrt : ' || sqrt(n1));
END;

/*Q5. Check if number is odd or even*/
set serveroutput on;
DECLARE 
  n1 number;
BEGIN
  n1 := 7;
  if mod(n1, 2) = 0 then
    dbms_output.put_line('EVEN');
  else
    dbms_output.put_line('ODD');
  end if;
END;

/*Q6. Using if find the greatest of 3 numbers*/
set serveroutput on;
DECLARE
  n1 number; 
  n2 number;
  n3 number;
BEGIN
  n1 := 3;
  n2 := 9;
  n3 := 5;
  if n1 > n2 then
    if n1 > n3 then
      dbms_output.put_line(n1);
    else 
      dbms_output.put_line(n3);
    end if;
  else
    dbms_output.put_line(n2);
  end if;
END;

/*Q6. Using if find the greatest of 3 numbers (...using logical operator 'and')*/
set serveroutput on;
DECLARE
  n1 number; 
  n2 number;
  n3 number;
BEGIN
  n1 := 3;
  n2 := 9;
  n3 := 5;
  if n1>n2 and n1>n3 then
    dbms_output.put_line(n1);
  else
    if n2>n3 then
      dbms_output.put_line(n2);
    else
      dbms_output.put_line(n3);
    end if;
  end if;
END;

/*Display Martins record with salary, job and bonus.
Bonus is :
President 75%, Analyst 60%, Manager 40%, Sales 30%, Client 20%*/
select * from employees;

set serveroutput on;
DECLARE 
  eid employees.employee_id%type;
  job employees.job_id%type;
BEGIN
  eid := 205;
  select job_id into job from employees where employee_id = eid;
  if job = 'AD_PRES' then
    dbms_output.put_line('Bonus : ' || 75 || '%');
  elsif job = 'IT_PROG' then
    dbms_output.put_line('Bonus : ' || 60 || '%');
  elsif job = 'MK_MAN' or job = 'SA_MAN' or job = 'ST_MAN' or job = 'FI_MAN' or job = 'PU_MAN' then
    dbms_output.put_line('Bonus : ' || 40 || '%');
    elsif job = 'SA_REP' then
    dbms_output.put_line('Bonus : ' || 30 || '%');
    elsif job = 'PU_CLERK' or job = 'ST_CLERK' or job = 'SH_CLERK' then
    dbms_output.put_line('Bonus : ' || 20 || '%');
    else
    dbms_output.put_line('No Bonus');
  end if;
END;
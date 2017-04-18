select * from user_procedures;

select * from employees;
/*---------------------Question 1--------------------------*/
create or replace procedure emp_details(empid number, mgr out number)
is
    emprec employees%rowtype;
begin
    select * into emprec from employees where employee_id = empid;
    dbms_output.put_line('EmpID  : '||emprec.employee_id);
    dbms_output.put_line('Name   : '||emprec.first_name);
    dbms_output.put_line('Job    : '||emprec.job_id);
    dbms_output.put_line('Salary : '||emprec.salary);
    mgr := emprec.manager_id;
end emp_details;


DECLARE
    empid number;
    mgrid number;
BEGIN
    empid := &empid;
    dbms_output.put_line('---EMP DETAILS---');
    emp_details(empid, mgrid);
    dbms_output.put_line('---MGR DETAILS---');
    emp_details(mgrid, mgrid);
END;

/*---------------------Question 2--------------------------*/
/*Classic Example of why Procedure Overloading does not 
    work when the procedures are not local to the anonymous block*/
    
drop procedure dept_details;

/*---------------------Question 2--------------------------*/
select * from employees;
select * from departments;

show error;

DECLARE
    procedure dept_details(dno number)
    is
        cursor c1 is select * from employees where department_id = dno;
    begin
        for x in c1 loop
            dbms_output.put_line('FNAME : '||x.first_name||' JOB : '||x.job_id||' SALARY : '||x.salary);
        end loop;
    end dept_details;
    
    procedure dept_details(dnm varchar)
    is 
        cursor c1(dno employees.department_id%type) is select * from  employees where department_id = dno;
        dept_id departments.department_id%type;
        emprec employees%rowtype;
    begin
        select department_id into dept_id from departments where upper(department_name) = upper(dnm);    
        open c1(dept_id);
        loop
            fetch c1 into emprec;
            exit when c1%notfound;
            dbms_output.put_line('FNAME : '||emprec.first_name||' JOB : '||emprec.job_id||' SALARY : '||emprec.salary);
        end loop;
        close c1;
    end dept_details;
BEGIN
    dept_details('it');
END;

/*---------------------Question 3--------------------------*/
/*Has be checked and validated for successfully displaying correct output*/

select * from employees;

DECLARE 
    procedure calc_netsal
    is
        cursor c1 is select employee_id, first_name, salary from employees;
        emprec c1%rowtype;
        hra number;
        da number;
        ta number;
        pf number;
        tax number;
        gross number;
        deduction number;
        netsal number;
    begin
        open c1;
        loop
            fetch c1 into emprec;
            exit when c1%notfound;
            hra := emprec.salary * 200/100;
            da := emprec.salary * 150/100;
            ta := emprec.salary * 20/100;
            pf := emprec.salary * 10/100;
            tax := emprec.salary * 25/100;
            gross := hra + da + ta;
            deduction := pf + tax;
            netsal := gross - deduction;
            dbms_output.put_line('EMPID : '||emprec.employee_id||' FNAME : '||emprec.first_name||' SAL : '||emprec.salary||' NETSAL : '||netsal);
        end loop;
        close c1;
    end calc_netsal;
BEGIN
    calc_netsal();
END;
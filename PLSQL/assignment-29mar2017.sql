select * from employees;

set serveroutput on;

/* Question 1 */
DECLARE
    cursor c1 is select first_name, salary, hire_date from employees;
    emprec1 c1%rowtype;
BEGIN
    open c1;
    loop 
        fetch c1 into emprec1;
        exit when c1%notfound;
        dbms_output.put_line('NAME : ' || emprec1.first_name);
        dbms_output.put_line('SALARY : ' || emprec1.salary);
        dbms_output.put_line('HIRE DATE : ' || emprec1.hire_date);
    end loop;
    close c1;
END;

/* Question 2 */
DECLARE
    cursor c1 is 
        select first_name, job_id, salary from employees where job_id in ('AS_PRES', 'SA_REP', 'ST_CLERK', 'IT_PROG', 'SA_MAN');
    fname employees.first_name%type;
    fjob employees.job_id%type;
    fsal employees.job_id%type;
    bonus number;
BEGIN
    open c1;
    loop
        fetch c1 into fname, fjob, fsal;
        exit when c1%notfound;
        if(fjob = 'AD_PRES') then
            bonus := 45;
        elsif(fjob = 'SA_REP') then
            bonus := 50;
        elsif(fjob = 'ST_CLERK') then
            bonus := 20;
        elsif(fjob = 'IT_PROG') then
            bonus := 30;
        elsif(fjob = 'SA_MAN') then
            bonus := 40;
        end if;
        dbms_output.put_line('NAME ' ||fname||' JOB '||fjob||' SAL '||fsal||' BONUS '||bonus);
    end loop;
    close c1;
END;

/* Question 3 */
select department_id, avg(salary) as a, sum(salary) as s, min(salary) as m1, max(salary) as m2, count(*) as c from employees group by department_id;

DECLARE
    cursor c1 is 
    select department_id, avg(salary) as a, sum(salary) as s, min(salary) as m1, max(salary) as m2, count(*) as c from employees group by department_id;
BEGIN
    for x in c1 loop
        dbms_output.put_line('-----DEPARTMENT'||' '||x.department_id||'-----');
        dbms_output.put_line('Average : '|| x.a);
        dbms_output.put_line('Sum : '|| x.s);
        dbms_output.put_line('Min : '|| x.m1);
        dbms_output.put_line('Max : '|| x.m2);
        dbms_output.put_line('Count : '|| x.c);
    end loop;
END;

/* Question 5 */
DECLARE
    cursor c1(fjob varchar) is
    select first_name, job_id, salary from employees where job_id = fjob; 
    emprec c1%rowtype;
    bonus number;
BEGIN
    open c1('&fjob');
    loop
        fetch c1 into emprec;
        exit when c1%notfound;
        if(emprec.job_id = 'AD_PRES') then
            bonus := 45;
        elsif(emprec.job_id = 'SA_REP') then
            bonus := 50;
        elsif(emprec.job_id = 'ST_CLERK') then
            bonus := 20;
        elsif(emprec.job_id = 'IT_PROG') then
            bonus := 30;
        elsif(emprec.job_id = 'SA_MAN') then
            bonus := 40;
        end if;
        dbms_output.put_line('Name   : ' || emprec.first_name);
        dbms_output.put_line('Job    : ' || emprec.job_id);
        dbms_output.put_line('Salary : ' || emprec.salary);
        dbms_output.put_line('Bonus  : ' || bonus);
    end loop;
    CLOSE c1;
END;

/* Question 6 */
select * from employees where first_name='Alana';

DECLARE
    cursor c1 is select job_id from employees where first_name='Alana';
    cursor c2(fjob employee.job_id%type) is select first_name, job_id, salary from employees where job_id=fjob;
    emprec1 c2%rowtype;
    fjob1 c1%rowtype;
BEGIN
    open c1;
    fetch c1 into fjob1;
    close c1;
    dbms_output.put_line(fjob1.job_id);
    open c2(fjob1.job_id);
    for x in c2 loop
        dbms_output.put_line('NAME : ' || emprec1.first_name);
        dbms_output.put_line('JOB  : ' || emprec1.job_id);
        dbms_output.put_line('SAL  : ' || emprec1.salary);
    end loop;
END;
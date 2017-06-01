/*
Following code demonstrates 'TYPE ________ IS RECORD'
i.e. Record Variable Type
*/
DECLARE
    TYPE emptype IS RECORD(
        eno emp.empno%type,
        enm emp.ename%type, 
        jb emp.job%type,
        sal emp.sal%type
    );
    emprec emptype;
BEGIN
    select empno, ename, job, sal into emprec.eno, emprec.enm, emprec.jb, emprec.sal from emp where empno=7499;
    dbms_output.put_line('EMPLOYEE NUMBER : '||emprec.eno);
    dbms_output.put_line('EMPLOYEE NAME   : '||emprec.enm);
    dbms_output.put_line('EMPLOYEE JOB    : '||emprec.jb);
    dbms_output.put_line('EMPLOYEE SALARY : '||emprec.sal);
END;

--Another Example of using different tables withing same record
DECLARE
    TYPE emptype IS RECORD(
        eno emp.empno%type,
        enm emp.ename%type, 
        jb emp.job%type,
        sal emp.sal%type,
        dnm dept.dname%type --Using Department Table
        
    );
    emprec emptype;
    
    eno emp.empno%type;
BEGIN
    eno := 7499;
    select empno, ename, job, sal into emprec.eno, emprec.enm, emprec.jb, emprec.sal from emp where empno=eno;
    dbms_output.put_line('EMPLOYEE NUMBER : '||emprec.eno);
    dbms_output.put_line('EMPLOYEE NAME   : '||emprec.enm);
    dbms_output.put_line('EMPLOYEE JOB    : '||emprec.jb);
    dbms_output.put_line('EMPLOYEE SALARY : '||emprec.sal);
    select dname into emprec.dnm from dept where deptno = (select deptno from emp where empno=eno);
    dbms_output.put_line('EMPLOYEE DEPT   : '||emprec.dnm);
END;

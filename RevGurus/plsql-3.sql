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

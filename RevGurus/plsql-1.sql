--Standard format for PLSQL File
/*
DECLARE (optional)
    
BEGIN   (mandatory)

EXCEPTION (optiona;)

END;    (mandatory)
*/

/*
All code has been executed at livesql.oracle.com
Create and Insert script that will be considered for the folling plsql-x.sql files is linked at 
"https://livesql.oracle.com/apex/livesql/file/content_O5AEB2HE08PYEPTGCFLZU9YCV.html"
*/

select * from tab;
/*
Output : 
TNAME	TABTYPE	CLUSTERID
DEPT	TABLE	 - 
EMP	    TABLE	 - 
*/

select * from dept;
/*
DEPTNO	DNAME	LOC
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

select * from emp;
/*
EMPNO	ENAME	JOB	        MGR	    HIREDATE	SAL	    COMM	DEPTNO
7839	KING	PRESIDENT	 - 	    17-NOV-81	5000	 - 	    10
7698	BLAKE	MANAGER	    7839	01-MAY-81	2850	 - 	    30
7782	CLARK	MANAGER	    7839	09-JUN-81	2450	 - 	    10
7566	JONES	MANAGER 	7839	02-APR-81	2975	 - 	    20
7788	SCOTT	ANALYST	    7566	19-APR-87	3000	 - 	    20
7902	FORD	ANALYST	    7566	03-DEC-81	3000	 - 	    20
7369	SMITH	CLERK	    7902	17-DEC-80	800	     - 	    20
7499	ALLEN	SALESMAN	7698	20-FEB-81	1600	300	    30
7521	WARD	SALESMAN	7698	22-FEB-81	1250	500	    30
7654	MARTIN	SALESMAN	7698	28-SEP-81	1250	1400	30
7844	TURNER	SALESMAN	7698	08-SEP-81	1500	0	    30
7876	ADAMS	CLERK	    7788	23-MAY-87	1100	 - 	    20
7900	JAMES	CLERK	    7698	03-DEC-81	950	     - 	    30
7934	MILLER	CLERK	    7782	23-JAN-82	1300	 - 	    10
*/

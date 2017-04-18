/*PLSQL - ARRAY*/


/*Simple PLSQL code demonstrating Array*/
DECLARE
    type namesarray is varray(5) of varchar2(10);
    type grades is varray(5) of integer;
    names namesarray;
    marks grades;
    total integer;
BEGIN
    names := namesarray('A', 'B', 'C', 'D', 'E');
    marks := grades();

END;
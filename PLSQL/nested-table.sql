--Nested Tables

set serveroutput on;

--Simple Version
DECLARE
    TYPE friends IS TABLE OF VARCHAR2(15);    
    names friends := friends('Prateek', 'Faizi', 'Jobin', 'Surya');
BEGIN
    for i in names.first..names.last loop
        dbms_output.put_line(names(i));
    end loop;

END;
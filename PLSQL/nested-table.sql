--Nested Tables

set serveroutput on;

--Simple Version
DECLARE
    TYPE friends IS TABLE OF VARCHAR2(15);    
    names friends := friends('Prateek', 'Faizi', 'Jobin', 'Surya');
BEGIN
    names(4) := 'Rohan';
    --names(5) := 'Surya';  --Does not work
    for i in names.first..names.last loop
        dbms_output.put_line(i);
        dbms_output.put_line(names(i));
    end loop;
END;

--A slightly nore ambitious version of NESTED TABLES
--Not Working (Gotta Figure out this Collections stuff)
DECLARE
    type rec is record(
        name varchar2(15),
        age number
    );
    r1 rec;
    
    type friends is table of r1;
    names friends := friends();
BEGIN
    names.extend;
END;
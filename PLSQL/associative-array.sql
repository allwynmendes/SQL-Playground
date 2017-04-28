--Associative Array

set serveroutput on;

DECLARE
    TYPE population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
    city_population population;
    i varchar2(64);
BEGIN
    city_population('Pune') := 3115000;
    city_population('Mumbai') := 18410000;
    city_population('Nashik') := 1486973;
    
    i := city_population.FIRST;
    
    while i is not null loop
        dbms_output.put_line('Populaton of '||i||' is '||city_population(i));
        i := city_population.NEXT(i);
    end loop;
END;

--Same thing, but using for loop
DECLARE
    TYPE phonenumbers IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
    family phonenumbers;
    i PLS_INTEGER;
BEGIN
    family(338) := 'Allwyn';
    family(337) := 'Tarcila';
    family(415) := 'Tony';
    
    i := family.first;
    
    while i is not null loop
        dbms_output.put_line(family(i));
        i := family.next(i);
    end loop;
END;

--Notice the output order is different from that of how it was inserted in code
/*Output :
Tarcila
Allwyn
Tony


PL/SQL procedure successfully completed.
*/
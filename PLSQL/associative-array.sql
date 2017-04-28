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
set serveroutput on;

create table test(
    nm number
);

truncate table test;

select count(*) from test;

DECLARE
    type abc is table of number index by binary_integer;
    a abc;
    l_size number := 50000;
    l_start number;
BEGIN
    for i in 1..l_size loop
        a(i) := i;
    end loop;
    
    execute immediate 'truncate table test';
    
    l_start := dbms_utility.get_time;
    for x in a.first..a.last loop
        insert into test values(a(x));
    end loop;
    dbms_output.put_line('Time Taken (genrally) : ' || (dbms_utility.get_time - l_start));
    
    execute immediate 'truncate table test';
    
    l_start := dbms_utility.get_time;
    forall x in a.first..a.last
        insert into test values(a(x));
    dbms_output.put_line('Time Taken (using for all) : ' || (dbms_utility.get_time - l_start));
    
END;

/*
Output:
Time Taken (genrally) : 167
Time Taken (using for all) : 4

PL/SQL procedure successfully completed.
*/
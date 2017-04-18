set serveroutput on;



declare
x number(2):=1;
begin
loop
exit when x=10; 
    dbms_output.put_line(x);
    x:=x+1;
end loop;
end;

declare 
--x number;
begin
for x in 3.4..10.7 loop
    dbms_output.put_line(x);
    end loop;
end;

declare
x number:=1;
y number;
begin
    while (x<10) loop
        y:=1;
        while(y<11) loop
            dbms_output.put_line(x*y);        
            y:=y+1;
        end loop;
        x:=x+1;
        
    end loop;
     
end;

DECLARE
       TYPE t IS TABLE OF VARCHAR2(323);
       names t := t(&names);
    BEGIN
        FOR j IN 1..names.COUNT LOOP
               dbms_output.put_line(j || names(j));
        END LOOP;
    END;
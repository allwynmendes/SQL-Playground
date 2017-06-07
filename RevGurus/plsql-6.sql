--Reverse of number
DECLARE
    n number:=123;
    r number;
    x number:=0;
BEGIN
    while n > 0 loop
        r:= mod(n,10);
        x := (x*10) + r;
        n := trunc(n/10);
    end loop;
    dbms_output.put_line(x);
END;

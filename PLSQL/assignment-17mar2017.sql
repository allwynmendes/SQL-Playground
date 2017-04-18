set serveroutput on;
--GDC home brewed logic
DECLARE
    n1 number;
    n2 number;
    temp number;
    i number;
    prod number := 1;
BEGIN
    n1:=&n1;
    n2:=&n2;
    temp := n1;
    i:=1;
    
    while i<temp/2 loop
        if mod(n1, i) + mod(n2, i) = 0 then
            prod := prod * i;
            n1 := trunc(n1/i);
            n2 := trunc(n2/i);
            i:=1;
        end if;
        i := i + 1;
    end loop;
    dbms_output.put_line('GCD is ' || prod);
END;

--GCD another logic
DECLARE
    n1 number;
    n2 number;
    i number;
BEGIN
    n1 := &n1;
    n2 := &n2;
    while(n1 > n2) loop
        n1 := n1 - n2;
        if(n1 = n2) then
            dbms_output.put_line('GCD IZ :' || n1);
        end if;
    end loop;
    
    while(n2 > n1) loop
        n2 := n2 - n1;
        if(n1 = n2) then
            dbms_output.put_line('GCD IZ ' || n2);
        else
            dbms_output.put_line('GCD IZ 1');
        end if;
    end loop;
END;

--LCM 
DECLARE
    n1 number;
    n2 number;
    i number := 1;
BEGIN
    n1 := &n1;
    n2 := &n2;

    while(1=1) loop
        if (mod(i,n1) + mod(i,n2)) = 0 then
            dbms_output.put_line('LCM IS ' || i);
            exit;
        end if;
        i := i + 1;
    end loop;
END;




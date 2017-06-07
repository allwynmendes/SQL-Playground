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

--Palindrome number
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
        if x=n then 
                dbms_output.put_line('palindrome');
            else
                dbms_output.put_line('not palindrome');
        end if;        
END;

--Armstrong number
DECLARE 
    original_num number;
    r number;
    sum1 number := 0;
    len1 number;
    num1 number;
BEGIN
    for n in 1..100000 loop
        original_num := n;
        num1 := n;
        select length(original_num) into len1 from dual;
        while num1 > 0 loop
            r := mod(num1, 10);           
            sum1 := sum1 + power(r,len1);
            num1 := trunc(num1/10);
        end loop;
        if sum1 = original_num then
            dbms_output.put_line(original_num);
        end if;
        sum1 := 0;
    end loop;
END;

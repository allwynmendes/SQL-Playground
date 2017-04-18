set serveroutput on;

declare
x number(3):=5;
begin
    loop
        loop
            loop
                dbms_output.put_line(x);
                exit;
            end loop;
            exit;
        end loop;
        exit;
    end loop;
    
end;

declare
x number(3):=5;
begin
<<b1>>
    loop
        loop
            loop
                dbms_output.put_line(x);
                exit b1 when x=5;
            end loop;
            --exit;
        end loop;
        --exit;
    end loop;
end;



declare
x number(3):=5;
begin
     dbms_output.put_line(x);
        declare
            y number(2):=10;
        begin
            dbms_output.put_line(x);
            dbms_output.put_line(y);
        end;  
        dbms_output.put_line(x);
            --dbms_output.put_line(y);
end;

set serveroutput on;

<<b11>>
declare
x number(3):=5;
begin
     -- dbms_output.put_line(x);
        declare
            x number(2):=10;
        begin
            dbms_output.put_line(b11.x);
            dbms_output.put_line(x);
        end;  
end;

set serveroutput on;

declare 
vjob emp.job%type;
vsal emp.sal%type;
vname emp.ename%type;
vbonus number:=0;

begin
vname :='&vname'; 

select job,sal into vjob,vsal from emp where ename=vname;
if vjob = 'MANAGER' then
goto M;
elsif vjob = 'PRESIDENT' then
goto P;
elsif vjob = 'ANALYST' then
goto A;
elsif vjob = 'CLERK' then
goto C;
elsif vjob = 'SALESMAN' then
goto S;
else
goto ST;
end if;
<<M>>
vbonus:=(vsal*60/100);
goto ST;
<<P>>
vbonus:=(vsal*0.80);
goto ST;
<<A>>
vbonus:=(vsal*0.50);
goto ST;
<<C>>
vbonus:=(vsal*0.40);
goto ST;
<<S>>
vbonus:=(vsal*0.30);
goto ST;
<<ST>>
dbms_output.put_line('Emp Name='||vname);
dbms_output.put_line('Emp Job='||vjob);
dbms_output.put_line('Emp Salary='||vsal);
dbms_output.put_line('Emp Bonus='||vbonus);
end;
-- Reverse of a number
declare 
rev number:=0;
n number:=0;
--s number:=0;
begin
    n:=&n;
    rev:=0;
    while (n!=0) loop
      --  s:=(mod(n,10));
        rev:=((rev*10)+(mod(n,10)));
        n:=(trunc(n/10));
    end loop;
    dbms_output.put_line('Reverse of Number Is :'|| rev);
end;

-- Palindrom of a number

declare 
rev number:=0;
n number:=0;
s number:=0;
begin
    n:=&n;
    s:=n;
    rev:=0;
    while (n!=0) loop
      --  s:=(mod(n,10));
        rev:=((rev*10)+(mod(n,10)));
        n:=(trunc(n/10));
    end loop;
    if (s=rev) then
    dbms_output.put_line(rev||' Number Is Palindrom');
    else
    dbms_output.put_line(rev||' Number Is Not Palindrom');
    end if;
end;



-- LCM number

set serveroutput on
 declare 
n1 number;
n2 number;
a number;
b number;

begin
n1:=&n1;
n2:=&n2;
a:=n1;
b:=n2;

while n1<n2 loop
n1:=(n1+a);
if n1=n2 then
    dbms_output.put_line('LCM Is:'||n1);
end if;
end loop;

while n2<n1 loop
n2:=(n2+b);
if n1=n2 then
    dbms_output.put_line('LCM Is:'||n2);
end if;
end loop;
end;
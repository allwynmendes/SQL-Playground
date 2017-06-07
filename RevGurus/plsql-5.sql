/*PLSQL Loops -
  1)Un-Conditional
  2)Conditional
*/
--simple if-else block
declare
    x number:=10;
begin
    x:=x+10;
    if x > 50 then
      dbms_output.put_line(x);
    else
      dbms_output.put_line('exit');
    end  if;
end;

--For loop
declare
    x number;
begin
    for x in 0 .. 10 loop
      dbms_output.put_line(x);
    end loop;
end;

--for loop for printing reverse 0 to 10 numbers
declare
    x number;
begin
    for x in reverse 0 .. 10 loop
        dbms_output.put_line(x);
    end loop;
end;

--while loop
DECLARE
    x number := 1;
BEGIN
    while x<=10 loop
        dbms_output.put_line(x);
        x := x + 1;
    end loop;
END;

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

Plymorphisom Procedure:

set serveroutput on;
declare 
procedure proc1_c(x number) is
begin
dbms_output.put_line(x);
end;
procedure proc1_c(y varchar2) is
begin
dbms_output.put_line(y);
end;
begin
proc1_c(101);
proc1_c('Hello');
proc1_c(202);
end;

desc user_procedures;

select object_name from user_procedures;
declare
create or replace procedure proc1_a(x number) is
begin
dbms_output.put_line(x);
end;
create or replace procedure proc1_a(y varchar2) is
begin
dbms_output.put_line(y);
end;
begin
proc1_a(101);
proc1_a('Hello');
proc1_a(202);
end;
set serveroutput on

declare
s number;
procedure proc1_c(x number) is
begin
    if(x>2) then
    proc1_c(x-2);
    end if;
dbms_output.put_line(x);
 end proc1_c;
begin
s :=&s;
dbms_output.put_line('In Main Block');
proc1_c(s);
dbms_output.put_line('In Main Block Again');
end;

  
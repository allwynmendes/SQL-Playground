set serveroutput on;

--Package Specification
create or replace package test_pack is
    procedure disp(x varchar2);
end test_pack;

--Package Body
create or replace package body test_pack is
    procedure disp(x varchar2) is
    begin
        dbms_output.put_line('Outputtt : '||x);
    end disp;
end test_pack;

--Calling Package test_pack and function disp within it
begin
    test_pack.disp('123');
end;
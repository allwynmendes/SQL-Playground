create table account(id number(2), amt number);

drop table account;

insert into account values(1, 1000);
insert into account values(2, 2000);
insert into account values(3, 3000);
insert into account values(4, 4000);
insert into account values(5, 5000);

select * from account;
show error;

set serveroutput on;

create or replace procedure add_amt(acc_id in account.id%type, amount in out account.amt%type) is
begin
    update account set amt = amt + amount where id = acc_id;
    select amt into amount from account where id = acc_id;
end;

declare
    vamt number;
begin
    vamt:=20;
    add_amt(2, vamt);
    dbms_output.put_line('New Ammount : ' || vamt);
end;

rollback;
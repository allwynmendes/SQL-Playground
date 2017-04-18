    set serveroutput on;
    
desc select * from cust_act_dts;

    
    create or replace procedure cal_amt
    (vaccno IN cust_act_dts.acc_no%type,
     vamt IN OUT cust_act_dts.act_bal%type) is
    begin

    update cust_act_dts
    set act_bal=act_bal+vamt
    where acc_no = vaccno;
    
    select act_bal into vamt from cust_act_dts
    where acc_no = vaccno;

    end cal_amt; 
    
     declare 
    vno cust_act_dts.acc_no%type;
    amt number;
    begin
    vno :=&vno;
    amt :=&amt;
    cal_amt(vno,amt);
    Dbms_Output.Put_Line('Acc No:'||vno);
    Dbms_Output.Put_Line('Acc Bal Is:'||amt);
    end;

create or replace procedure p22(no in emp.empno%type,
                                enm out emp.ename%type,
                                sl out emp.sal%type) is
begin
select ename,sal into enm,sl from emp where empno=no;
end;
                                
declare 
n emp.empno%type;
nm emp.ename%type;
s11 emp.sal%type;
begin
n:=&n;
p22(n,nm,s11);
    Dbms_Output.Put_Line('Acc No:'||n);
    Dbms_Output.Put_Line('Acc Sal Is:'||s11);
    Dbms_Output.Put_Line('Acc Name:'||nm);
    
end;


create or replace function f1_mult(n1 in int,n2 in int)
return number
is
z number;
begin
z:=n1*n2;
return z;
end f1_mult;

select f1_mult(10,30) from dual;

exec f1_mult(10);

show function f1_mult;

desc select * from user_procedures;
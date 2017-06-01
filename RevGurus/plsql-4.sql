--Blocks and subblocks

--implementing subblock within a block
declare
   var1 number:= 10;
   
begin
     dbms_output.put_line(var1);
     
     declare
         var2 number:=20;
         
         begin
            dbms_output.put_line(var2);
            dbms_output.put_line(var1);
        end;
       
       dbms_output.put_line(var2);--line15
       dbms_output.put_line(var1); 
end;

/*output:
ORA-06550: line 15, column 29:
PLS-00201: identifier 'VAR2' must be declared 
*/
/*--------------------------------------------------------------------------------------------------------*/

--Implemented Code Below using <<labels>>
declare
    var1 number:= 10;
begin
    dbms_output.put_line(var1);
    <<B1>>
    declare
        var1 number:=20;
    begin
        dbms_output.put_line(var1);
        dbms_output.put_line(B1.var1);
    end;
    dbms_output.put_line(var1);
    dbms_output.put_line(B1.var1); 
end;

/*
ORA-06550: line 16, column 32:
PLS-00219: label 'B1' reference is out of scope 
*/

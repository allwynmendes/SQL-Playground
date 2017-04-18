CREATE OR REPLACE PROCEDURE ddl_create_proc (p_table_name VARCHAR2)

 AS

 l_stmt VARCHAR2(200);

 BEGIN

 DBMS_OUTPUT.put_line('STARTING ');

 l_stmt := 'create table '|| p_table_name || ' as select * from emp ';

 execute IMMEDIATE l_stmt;

 DBMS_OUTPUT.put_line('end ');

 EXCEPTION

 WHEN OTHERS THEN

 DBMS_OUTPUT.put_line('exception '||SQLERRM || 'message'||sqlcode);

 END; 

CREATE OR REPLACE PROCEDURE ddl_create_proc (p_table_name VARCHAR2)

 AS

 l_stmt VARCHAR2(200);

 BEGIN

 DBMS_OUTPUT.put_line('STARTING ');

 l_stmt:='create table' || p_table_name ||  'as select * from emp' ;
execute immediate l_stmt;
 DBMS_OUTPUT.put_line('end ');

 EXCEPTION

 WHEN OTHERS THEN

 DBMS_OUTPUT.put_line('exception '||SQLERRM || 'message'||sqlcode);

 END; 

begin
ddl_create_proc('e2');
end;

select * from e2;
 
begin
ddl_create_proc('p1');
end;

select * from emp;

select * from e1;

select * from p1;

desc e1;

create table e3 as select * from emp;

select * from e3;

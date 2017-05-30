/*--------------------------------------------------------------------*/
SELECT * FROM RPRO_ARR_TRANSACTIONS;

DESC RPRO_ARR_TRANSACTIONS;

select * from all_constraints where table_name=upper('RPRO_ARR_TRANSACTIONS');

select dbms_metadata.get_ddl( 'TABLE', 'RPRO_ARR_TRANSACTIONS', 'REVPRO_RGURU_NEW' ) from dual;
/*--------------------------------------------------------------------*/
SELECT * FROM RPRO_USERS;

DESC RPRO_USERS;

select * from all_constraints where table_name=upper('RPRO_USERS');

select * from all_cons_columns where table_name=upper('RPRO_USERS');

--The get the create table structure
select dbms_metadata.get_ddl( 'TABLE', 'RPRO_USERS', 'REVPRO_RGURU_NEW' ) from dual;

select * from all_constraints;
select * from all_cons_columns;

/*--------------------------------------------------------------------*/
select * from all_constraints WHERE constraint_type='R' AND CONSTRAINT_NAME='RPRO_USERS_R01';




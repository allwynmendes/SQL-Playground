/* Day # 1 Assignments */

/* Question 1 */
create table member(
  member_id number(5),
  member_name varchar2(30),
  member_address varchar2(50),
  acc_open_date date,
  membership_type varchar2(20),
  fees_paid number(4),
  max_books_allowed number(2),
  penalty_amount number(7,2)
);

create table books(
  book_no number(6),
  book_name varchar2(30),
  author_name varchar2(30),
  cost number(7,2),
  category char(10)
);

create table issue(
  lib_issue_id number(10),
  book_no number(6),
  member_id number(5),
  issue_date date,
  return_date date
);

select * from tab;

/* Question 2 */

desc member;
desc books;
desc issue;

/* Question 3 */

drop table member;

/* Question 4 */

create table member(
  member_id number(5),
  member_name varchar2(30),
  member_address varchar2(50),
  acc_open_date date,
  membership_type varchar2(20),
  fees_paid number(4),
  max_books_allowed number(2),
  penalty_amount number(7,2),
  constraint member_id_pk primary key(member_id),
  constraint membership_type_check check(membership_type in('Lifetime', 'Annual', 'Half Yearly', 'Quarterly'))
);

desc member;

select * from user_constraints
where table_name=upper('member'); 

/* Question 5 - Already 30 Characters */

desc member;

/*This works on Oracle prior to 10G
For more : http://www.w3schools.com/sql/sql_alter.asp*/
alter table member
modify member_name varchar2(30);  

/* Question 6 */

desc issue;

alter table issue
add reference char(30);

/* Question 7 */

alter table issue
drop column reference;

/* Question 8 */

alter table issue
rename to lib_issue;

desc lib_issue;

/* Question 9 */

desc member;

/*In Question given 25000 but will not work because type is number(4)*/
insert into member values (1, 'Richa Sharma', 'Pune', '10-Dec-05',
'Lifetime', 2500, 5, 50);
insert into member values (2, 'Garima Sen', 'Pune', sysdate,
'Annual', 1000, 3, null);

select * from member;

/* Question 10 */

desc member;

insert into member values(3, 'Allwyn Mendes', 'Goa', '06-MAR-2016', 'Quarterly', 1000, 2, 50);
insert into member values(4, 'Tarcila Mendes', 'Sharjah', '17-JAN-2013', 'Half Yearly', 2000, 3, 50);
insert into member values(5, 'Sonia Soares', 'Netherlands', '07-FEB-2009', 'Lifetime', 5000, 10, Null);
insert into member values(6, 'Ilda Soares', 'Dubai', '08-NOV-2011', 'Annual', 3000, 5, 25);
insert into member values(7, 'Carlos Gonsalvez', 'Goa', '17-OCT-2016', 'Quarterly', 1000, 2, 50);

select * from member;

/* Question 11 */

alter table member
modify member_name varchar2(20);

desc member;

/* Question 12 */
desc member;
insert into member values(8, 'Milosha Faria', 'Goa', '23-AUG-2011', 'Quarterly', 1000, 110, 50);
  /*MAX_BOOKS_ALLOWED = 110 will not work here because its type is number(2)*/
  
/* Question 13 */

create table member101 as select * from member where 1 = 2;
desc member101;

/* Question 14 */

desc member101;

alter table member101
add constraint maxbooksallowed_member101_ck check (max_books_allowed < 100);
alter table member101
add constraint penaltyamount_member101_ck check (penalty_amount >= 1000);

/* Question 15 */

drop table books;

/* Question 16 */

create table books(
  book_no number(6) primary key,
  book_name varchar2(30) not null,
  author_name varchar2(30),
  cost number(7,2),
  category char(10),
  constraint books_category_ck check(category in('Science', 'Fiction', 'Database', 'RDBSM', 'Others'))
);

/* Question 17 */

desc books;
insert into books values(101, 'Let us C', 'Denis Ritchie', 450, 'System');/*Will not work
Constraint Issue*/
insert into books values(102, 'Oracle - Complete Ref', 'Loni', 550, 'Database');
insert into books values(102, 'Oracle - Complete Ref', 'Loni', 550, 'Database');
insert into books values(103, 'Mastering SQL', 'Loni', 250, 'Database');
insert into books values(104, 'PL SQL- Ref', 'Scott Urman', 750, 'Database');
/*Modified as per requirements*/
insert into books values(101, 'Let us C', 'Denis Ritchie', 450, 'Others');

/* Question 18 */

  /*WTF is & operator*/
  
/* Question 19 */

create table book101 as select * from books where 1=2;
desc book101;

/* Question 20 */

insert into book101 select * from books;

select * from books;
select * from book101;

/* Question 21 */

commit;

/* Question 22 */

select * from member;
select * from books;
select * from issue;

/* Question 23 */

insert into books values(105, 'National Geographic', 'Adis Scott', 1000, 'Science');

/* Question 24 */
rollback;
select * from books;

/* Question 25 */
update books set cost=300 where book_no=103;
select * from books;

/* Question 26 */
alter table lib_issue
rename to issue;

/* Question 27 */
desc issue;
drop table issue;

/* Question 28 */
desc books;
desc member;

create table issue(
  lib_issue_id number(10) primary key,
  book_no number(6) references books(book_no),
  member_id number(5) references member(member_id),
  issue_date date,
  return_date date
);

alter table issue
add constraint issue_returndate_ck check(return_date>issue_date); 
/* Question 29 */

desc issue;
select * from books;
select * from member;

insert into issue(lib_issue_id, book_no, member_id, issue_date) values (7001, 101, 1, '10-DEC-06');
insert into issue(lib_issue_id, book_no, member_id, issue_date) values (7002, 102, 2, '25-DEC-06');
insert into issue(lib_issue_id, book_no, member_id, issue_date) values (7003, 104, 1, '15-JAN-06');
insert into issue(lib_issue_id, book_no, member_id, issue_date) values (7004, 101, 1, '04-JUL-06');
insert into issue(lib_issue_id, book_no, member_id, issue_date) values (7005, 104, 2, '15-NOV-06');
insert into issue(lib_issue_id, book_no, member_id, issue_date) values (7006, 101, 3, '18-FEB-06');

/* Question 30 */
COMMIT;

/* Question 31 */
select * from user_constraints where table_name=upper('issue');

alter table issue
disable constraint SYS_C007081;
alter table issue
disable constraint SYS_C007082;
alter table issue
disable constraint SYS_C007083;
alter table issue
disable constraint ISSUE_RETURNDATE_CK;

/* Question 32 */
desc issue;
select * from issue;
select * from books;
select * from member;

insert into issue (lib_issue_id, book_no, member_id, issue_date) values (7007, 104, 8, '19-feb-06');

/* Question 33 */

alter table issue
enable constraint SYS_C007081;
alter table issue
enable constraint SYS_C007082;
alter table issue
enable constraint SYS_C007083; /*This generates error*/
alter table issue
enable constraint ISSUE_RETURNDATE_CK;

/* Question 34 */
select * from issue;

delete from issue where lib_issue_id = 7007;

alter table issue
enable constraint SYS_C007083;

/* Question 35 */
select * from member;
delete from member where member_id = 1;

/* Question 36 */
select * from issue;
update issue set return_date = issue_date + 5 where lib_issue_id in (7004, 7005); 

/* Question 37 */
select * from member;
update member set penalty_amount = 100 where member_name='Garima Sen';

/* Question 38 */
savepoint x;

/* Question 39 */
select * from issue;
delete from issue where (member_id = 1 and issue_date < '10-dec-2006');

/* Question 40 */
select * from books;
delete from books where not (CATEGORY IN ('RDBMS', 'DATABASE'));
  /*Forgot to put ON DELETE CASCADE, thats why its not deleting*/
  
/* Question 41 */
ROLLBACK X;
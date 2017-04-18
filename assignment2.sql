select * from member;
select * from books;
select * from issue;

/* Question 1 */
select * from books where author_name = 'Loni' and cost<600;

/* Question 2 */
select * from issue where return_date is null;

/* Question 3 */
update issue set return_date = '31-dec-06' where lib_issue_id != 7005;

/* Question 4 */
select * from books where book_no in(select book_no from issue where return_date-issue_date>30);

/* Question 5 */
select * from books where cost between 500 and 750 and category='Database';

/* Question 6 */
select * from books where category in ('Database', 'Science', 'Fiction', 
'Managment');

/* Question 7 */
select * from member order by penalty_amount desc;

/* Question 8 */
select * from books order by category asc, cost desc;

/* Question 9 */
select * from books where book_name like'%SQL%';

/* Question 10*/
select * from member where member_name like 'R%i%' or member_name like 'G%i%'; 

/*-------------------*/
select * from member;
select * from books;
select * from issue;
/*-------------------*/

/* Question 11 */
select initcap(book_name), upper(author_name) from books order by book_name desc;

/* Question 12 */
select to_char(issue_date, 'DAY, MON, DD, YYYY') from issue where member_id = 1;

/* Question 13 */
select concat(concat(substr(category, 0, 1) , ' for '), category) from books;

/* Question 14 */
select * from member where to_char(acc_open_date, 'YYYY') = 2009;

/* Question 15 */
select lib_issue_id, issue_date, return_date, return_date - issue_date from issue;

/* Question 16 */
select * from member order by acc_open_date;

/* Question 17 */
select count(*) from issue where member_id=1;  

/* Question 18 */
select sum(penalty_amount) from member;

/* Question 19 */
select count(*) from member;

/* Question 20 */
select count(*) from (select nvl(to_char(return_date, 'DD-MON-YYYY'), 0) as a1 from issue) where a1 = '0';
/*Could also be ...*/
select count(*) from issue;

/*-------------------*/
select * from member;
select * from books;
select * from issue;
/*-------------------*/

/* Question 21 */
select avg(fees_paid) from member;

/* Question 22 */
select months_between(return_date, issue_date) from issue;

/* Question 23 */
select length(member_name) from member;

/* Question 24 */
select substr(membership_type, 1, 5) from member;

/* Question 25 */
select issue_date + 21 "Last day MoFozzzz" from issue;

/* Question 26 */
select * from books where book_name like 'L%';

/* Question 27 */
select replace('We are driving south by south east', 'south', 'North') from dual;

/* Question 28 */
select * from member where member_name like 'R%';

/* Question 29 */
select * from books where book_name like '%SQL';

/* Question 30 */
select * from books where author_name like 'L%';

/*-------------------*/
select * from member;
select * from books;
select * from issue;
/*-------------------*/

/* Question 31 */
select * from member where upper(member_name) like 'GA%';

/* Question 32 */
select replace(book_name, 'Mastering', 'Advanced') from books; 

/* Question 33 */
select replace(author_name, 'Scott Urman', 'Scott K Urman') from books;
use employees;
select * 
from 
	salaries
order by salary
limit 10;

/*when applied without a group by is considered a group by all the columns on the table*/
select count(emp_no), count(salary) 
from salaries;


select * 
from titles
where employees.titles.to_date = null ;

describe titles;

insert into titles()
values (
	49239,
    'senior engineer',
    '2017-01-01',
    null
);

select
count(*)
from titles
where to_date is null ;

/*Checking groupby without distinct */

select from_date, count(from_date) as same_start_date
from titles 
group by from_date
order by from_date;

/*Using distinct */


select from_date, count( distinct from_date)
from titles 
group by from_date
order by from_date desc;


/*how many dates "from_date" are in titles table*/

create view view1 as select count(*)
from titles
group by from_date ;

select count(*) from view1;

select count(distinct from_date )
from titles;

/*How many departments are in the employee database */
select count(dept_no ) as number_departments
from departments;


select sum(salary) 
from salaries
limit 10;

/*What is the total amount of money spent on salaries 
for all contracts starting after the 1st of January 1997?
*/
select
sum(salary)
from salaries
where from_date > '1997-01-01';

/*MAX*/

select max(salary)
from salaries
group by salary;


select salary
from salaries
group by salary;


select max(salary)
from salaries;

select min(salary)
from salaries;

select min(emp_no)
from employees;


select max(emp_no)
from employees;

select avg(salary)
from salaries;

select round(avg(salary), 2)
from salaries;


select avg(salary)
from salaries
where from_date > '1997-01-01';

/*Coalesce preliminaries*/

alter table departments_dup
change column dept_name dept_name varchar(40) null ;

update departments_dup
set dept_no = 'd010', dept_name = null
where dept_no = 'd010';

insert into departments_dup 
values
('d011',null);

select * 
from departments_dup
where dept_name is null;



alter table  departments_dup
add column dept_manager varchar(255) null after dept_name;

describe departments_dup;

select * 
from departments_du	p
order by dept_no desc;

commit;
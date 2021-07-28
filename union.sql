
drop table if exists employees_dup;

create table employees_dup(
	emp_no int(11),
    birth_date date not null,
    first_name varchar(14),
    last_name varchar(16),
    gender enum('M','F'),
    hire_date date
);

insert into employees_dup
select e.*
from employees e
limit 20;

/*inserting a duplicate of the first row*/
select * from employees_dup limit 1;
insert into employees_dup values
('10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');



/*UNION ALL
used to combine a few select statements in a single output
it unifies tables 
The selects need to have integrity when talking 
1.same number of columns N
2.- same names on the columns 
3. same order of this column
4. same data types 

select 
	N columns
from table1
UNION ALL 
select 
	N columns
from table2;

*/

/*example of making integrity */

select 
	e.emp_no,
    e.first_name,
    e.last_name,
    NULL as dept_no,
    NULL as from_date
from employees_dup e
union  
select
	null as emp_no,
    null as first_name,
    null as second_name,
    dm.dept_no,
    dm.from_date
from dept_manager dm;

/*
UNION:displays only distinct values 
UNION ALL: displays all the data includin duplicates
*/








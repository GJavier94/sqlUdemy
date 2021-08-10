use employees;

commit;


/*
Assign employee number 110022 as a manager to all employees from 
10001 to 10020 
and employee number  110039 as a manager to all employees  
from 10021 to 10040
*/
use employees;


select A.* 
from 
	(select e.emp_no, min(de.dept_no), (select emp_no 
						from dept_manager 
						where emp_no = 110022)
						 as manager
	from employees e
    inner join dept_emp de on de.emp_no = e.emp_no
	where e.emp_no >= 10001 and e.emp_no <= 10020
    group by e.emp_no ) as A
union all
select B.*
from 
	(select e.emp_no , min(de.dept_no), (select emp_no 
						from dept_manager 
						where emp_no = 110039)
						 as manager
	from employees e
    inner join dept_emp de on de.emp_no = e.emp_no
	where e.emp_no >= 10021 and e.emp_no <= 10040
    group by e.emp_no) as B;
    
    
/*
exercise 1
Starting your code with “DROP TABLE”, 
create a table called “emp_manager” 
(emp_no – integer of 11, not null; 
dept_no – CHAR of 4, null;
manager_no – integer of 11, not null). 
*/

drop table if exists emp_manager;
create table emp_manager(
	emp_no int(11) not null,
    dept_no char(4) null,
    manager_no int(11) not null
);

describe emp_manager;

/*
Fill emp_manager with data about employees, the number of the department they are working in, and their managers.
Your query skeleton must be:
Insert INTO emp_manager SELECT
U.*
FROM
                 (A)
UNION (B) UNION (C) UNION (D) AS U;
A and B should be the same subsets used in the last lecture (SQL Subqueries Nested in SELECT and FROM). 
In other words, assign employee number 110022 as a manager to all employees from 10001 to 10020 (this must be subset A), 
and employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B).
Use the structure of subset A to create subset C, 
where you must assign employee number 110039 as a manager to employee 110022.
Following the same logic, create subset D. 
Here you must do the opposite - assign employee 110022 as a manager to employee 110039.
Your output must contain 42 rows.
Good luck!
*/
select A.*
from
	(select e.emp_no, min(de.dept_no),  (select dm.emp_no from dept_manager dm  where dm.emp_no = 110039) as manager
	from employees e
	inner join dept_emp de on de.emp_no = e.emp_no
	where e.emp_no >= 10001 and e.emp_no <= 10020 
	group by de.emp_no) as A
union
select C.*
from
	(select e.emp_no, min(de.dept_no),  (select dm.emp_no from dept_manager dm  where dm.emp_no = 110022) as manager
	from employees e
	inner join dept_emp de on de.emp_no = e.emp_no
	where e.emp_no = 110039  
	group by de.emp_no ) as C
union 
select B.*
from
	(select e.emp_no, min(de.dept_no),  (select dm.emp_no from dept_manager dm  where dm.emp_no = 110039) as manager
	from employees e
	inner join dept_emp de on de.emp_no = e.emp_no
	where e.emp_no >= 10021 and e.emp_no <= 10040
	group by de.emp_no) as B
union
select D.*
from 
	(select e.emp_no, min(de.dept_no),  (select dm.emp_no from dept_manager dm  where dm.emp_no = 110039) as manager
	from employees e
	inner join dept_emp de on de.emp_no = e.emp_no
	where e.emp_no = 110022
	group by de.emp_no) as D;

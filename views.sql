use employees;


select emp_no, count(emp_no) as number_departments
from dept_emp 
group by emp_no
order by number_departments desc
;

 
create view empl_department_latest_date as
select emp_no, max(from_date) as from_date, max(to_date) as to_date
from dept_emp
group by emp_no; 


select *
from empl_department_latest_date;


select count(*) 
from salaries;


select count(distinct dept_no) 
from departments;










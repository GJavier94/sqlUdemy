
insert into departments
values(
	'd010',
    'Business Analysis'
);


use employees;

select *
from employees
order by employees.emp_no desc;

select *
from employees.employees
where emp_no = 999901;

update employees.employees
set 
	employees.employees.first_name = 'stella',
    employees.employees.last_name = "Parkinson",
    employees.employees.birth_date = '1990-12-31',
    gender = 'M'
where emp_no = '999901';

select *
from employees.employees
where emp_no = 999901;


select * 
from departments_dup;

commit;

alter table departments_dup drop index dept_name;	
describe table departments_dup;


commit;

update departments_dup
set 
    employees.departments_dup.dept_name = "Quality control" ;

select * 
from departments_dup;

rollback;

select * 
from departments_dup;

update departments
set 
	employees.departments.dept_name = 'Data Analysis'
where employees.departments.dept_name = 'Business Analysis';


select * 
from departments;


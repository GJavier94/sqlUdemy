use employees; 
commit;

describe employees;



select * 
from employees 
where emp_no = 999903;

commit;

delete 
from employees 
where employees.emp_no = '999903';

select * 
from employees
where employees.emp_no  = '999903';

rollback;

select * from titles where titles.emp_no  = '999903';

commit;

delete from departments 
where dept_no = 'd010';

select count(*) from departments;


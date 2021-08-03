use employees;

commit;


/**/
select A.*
from 
( select 
	e.emp_no as employee_ID, 
	min(de.dept_no) as department_code,
	(select dm.emp_no from dept_manager dm where dm.emp_no = 110022) as manager_ID
from employees e
inner join dept_emp de on de.emp_no = e.emp_no
where e.emp_no <= 10020
group by e.emp_no
order by e.emp_no ) as A
UNION 
select B.*
from (
	select 
		e.emp_no as employee_ID,
		min(de.dept_no) as department_code,
		(select emp_no from dept_manager where emp_no = 110039) as manager_ID
	from employees e
	inner join dept_emp de on e.emp_no = de.emp_no 
	where e.emp_no >= 10021 and e.emp_no <= 10040
	group by e.emp_no 
	order by e.emp_no) as B;

rollback;
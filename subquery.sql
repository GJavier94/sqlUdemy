/*Using subqueries to compare two tables*/
select * 
from
	/*first table*/
	(select customerName 
	from customers 
	where customerNumber not in (select customerNumber from orders) ) as s1,
    /*second table*/
	(select customerName
	from customers c 
	left join orders o on c.customerNumber = o.customerNumber
	where o.orderNumber is null) as s2
where s1.customerName != s1.customerName;


/*Extract the information about all department managers 
who were hired between the 1st of January 1990 
and the 1st of January 1995.*/

select * 
from employees e
where e.emp_no in (select emp_no
		from dept_manager) and e.hire_date >= '1990-01-01'
        and e.hire_date <= '1995-01-01'
order by hire_date;


select * 
from dept_manager dm
where dm.emp_no in (select emp_no from employees e where e.hire_date >= '1990-01-01'
        and e.hire_date <= '1995-01-01')
order by dm.emp_no;





/*Select the entire information for all employees 
whose job title is “Assistant Engineer”.*/

select * 
from employees e
where exists(select * 
	from titles t
	where t.emp_no = e.emp_no and t.title = 'Assistant Engineer'
	);














select * 
from 
employees
order by emp_no desc 
limit 10;


insert into 
employees(
	emp_no,
    
    first_name, 
    last_name, 
    gender, 
    birth_date,
    hire_date
    )
values
(
999902,
'jennifer',
'lawrence',
'F',
'1996-04-21',
'2012-01-21'
) 
;


select *
from titles
limit 10;


select * 
from employees
where emp_no = 999903;
insert into employees
values
(
999903,
'1990-03-03',
'alejandro',
'bautista',
'M',
'1996-04-21'
); 


insert into titles
values(
	999903,
    "Senior Engineer",
    "1997-10-01",
	null
);


select *
from titles
order by emp_no desc
limit 10;
/*
insert into departments
values(
	5,
    "sales_department"
);
*/
delete
from departments 
where dept_no = '5';


select * 
from departments ;
/*where dept_no = '5';*/

select * 
from employees
where emp_no = 999903;


insert into dept_emp
(
	emp_no,
    dept_no,
    from_date,
    to_date
)
values
(
	999903,
    'd005',
    '1997-10-01',
    '9999-01-01'
);

select *
from departments
order by dept_no;



CREATE TABLE departments_dup (
  dept_no char(4) NOT NULL,
  dept_name varchar(40) NOT NULL,
  PRIMARY KEY (dept_no),
  UNIQUE KEY (dept_name)
  );

delete from departments_dup;


insert into departments_dup
select *
from employees.departments;


select * 
from departments_dup;




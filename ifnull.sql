create table department_dup(
	dept_no char(4) not null,
    dept_name varchar(40) not null,
    primary key(dept_no),
    unique key (dept_name)
);

insert into department_dup()
select *
from departments;

select *
from department_dup;


alter table department_dup
change column dept_name dept_name varchar(40)  NULL ; 


insert into department_dup()
values
('d012',null),
('d013',null);

alter table department_dup
add column department_manager varchar(255) null;

alter table department_dup
change column  department_manager  dept_manager varchar(255) null after dept_name;


describe department_dup;

/*IFNULL allows to change a null field for a especific expression */
select dept_no, 
	IFNULL(dept_name, 'Department name not provided') as dept_name, 
    ifnull(dept_manager, "department manger not provided") as dept_manager
from department_dup;

/* acts as ifnull function except that accepts n arguments 
assigning the first non-nul argument to the field in question
it means that coalesce with 2 arguments is equals to ifnull
*/
select 
	dept_no, 
	dept_name,
    coalesce(dept_manager,dept_name,  "N/A") as dept_manager
from department_dup;


/*Coalesce can also be used to display literal strings into a new column */
select
	dept_no,
	dept_name,
    coalesce("department manager has not been provided") as fake_col 
from department_dup;

/*
Select the department number and name from the ‘departments_dup’ table 
and add a third column where you name the department number (‘dept_no’) as ‘dept_info’. 
If ‘dept_no’ does not have a value, use ‘dept_name’.
*/

/*
Modify the code obtained from the previous exercise in the following way. 
Apply the IFNULL() function to the values from the first and second column, 
	so that ‘N/A’ is displayed whenever a department number has no value, 
and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.
*/

select 
	ifnull( dept_no ,'N/A') as dept_no,
    ifnull(dept_name,'Department not provided') as dept_name,
    coalesce(dept_no, dept_name) as dept_info
from department_dup
order by dept_no asc;




use employees;
/*CREATING SOME CHANGES TO UNDERSTAND JOIN TYPES*/

/*create a duplicate of dept_manager table*/
show tables;
create table dept_manager_dup(
	emp_no int not null,
    dept_no char(4) not null,
    from_date date not null,
    to_date date not null,
primary key(emp_no, dept_no),
foreign key (emp_no) references employees(emp_no) on delete cascade,
foreign key (dept_no) references departments(dept_no) on delete cascade
);

commit;

insert into dept_manager_dup
select * 
from dept_manager;

select count(*) from dept_manager_dup ;
select count(*) from dept_manager;

describe department_dup;

alter table department_dup 
drop column dept_manager;

alter table department_dup
drop primary key;


alter table department_dup
change column dept_no dept_no char(4) null;

alter table department_dup
change column dept_name dept_name varchar(40) null;

select *
from department_dup
order by dept_no desc;

delete from  department_dup
where dept_no = 'd002';
DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';

insert into department_dup() values (null, "Public Relations");
insert into department_dup() values ("d010", null);
insert into department_dup() values ("d011", null);

/*Creating dept_manager_dup*/
DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );
INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES(999904, '2017-01-01'),
(999905, '2017-01-01'),
(999906, '2017-01-01'),
(999907, '2017-01-01');

DELETE FROM dept_manager_dup
WHERE
    dept_no = 'd001';

DELETE FROM department_dup
WHERE
    dept_no = 'd002'; 


insert into dept_manager_dup
select * 
from dept_manager;


/*JOIN between department_manager_dup and department dup 
checking the current table */
select * 
from dept_manager_dup;

select 
	t1.emp_no, t1.dept_no, t1.from_date, t2.dept_name
from
	dept_manager_dup t1
join department_dup t2 on t1.dept_no = t2.dept_no;

/*alias for dept_manager_dup m
alias for department_dup d*/

select m.dept_no, m.emp_no, d.dept_name
from 
	dept_manager_dup m
inner join department_dup d on m.dept_no = d.dept_no
order by dept_no;

/*
Extract a list containing information about all managers’ employee number,
 first and last name, department number, and hire date. 
*/

select e.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
from employees e
inner join dept_manager_dup m on m.emp_no = e.emp_no;


/*Duplicate records on uncontrolled dataset*/
select * 
from dept_manager_dup;

/*
Inserting duplicate values...
 It is possible to insert it cause this table doesn't have 
primary or unique key*/

insert into dept_manager_dup()
values  ('110228', 'd003', '1992-03-21', '9999-01-01');


alter table department_dup
drop index dept_name;

insert into department_dup()
values ('d009','Customer Service');

select m.dept_no, m.emp_no, d.dept_name
from 
	dept_manager_dup m
inner join department_dup d on m.dept_no = d.dept_no
group by m.emp_no, m.dept_no, d.dept_name
order by dept_no;

/*
Just to watch how group by works

drop table tabla1;

create table tabla1(
	campo1 varchar(255),
    campo2 varchar(255),
    campo3 varchar(255)
);

insert into tabla1()
values
("mexico","hidalgo","tizayuca"),
("mexico","hidalgo","tizayuca"),
("mexico","hidalgo","tizayuca"),
("mexico","hidalgo","actopan"),
("mexico","hidalgo","actopan"),
("mexico","cdmx","gam");

select campo1, campo2, count(campo1), count(campo2)
from tabla1
group by campo1,campo2;

*/


/*LEFT JOIN
A , B Tables
intersection of keys between A and B plus all the keys,null values that are in A and not in B
that's why ordering table matters
*/
/*Removing duplicates*/
delete from dept_manager_dup
where emp_no = '110228';
delete from department_dup
where dept_no = 'd009';

insert into dept_manager_dup
values('110228','d003','1992-03-21','9999-01-01');

insert into department_dup
values('d009','Customer Service');

select m.dept_no, m.emp_no, d.dept_name
from 
	dept_manager_dup m 
left outer join 
	department_dup d on m.dept_no = d.dept_no
group by m.dept_no, m.emp_no, d.dept_name
order by m.dept_no;
/*by switching table's order we get values from b that are not in atoB and a */

select d.dept_no, m.emp_no, d.dept_name
from
	department_dup d
left join dept_manager_dup m on d.dept_no = m.dept_no
group by d.dept_no, m.emp_no, d.dept_name
order by d.dept_no;

/*can we get only keys that are only in table A and not in B? */


select m.dept_no, m.emp_no, d.dept_name
from
	dept_manager_dup m 
left join department_dup d on d.dept_no = m.dept_no
where dept_name is null
group by m.dept_no, m.emp_no, d.dept_name
order by m.dept_no;

/*
Join the 'employees' and the 'dept_manager' tables 
to return a subset of all the employees 
whose last name is Markovitch. 
See if the output contains a manager with that name.  
*/

select  e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
from  
	dept_manager_dup m
left join 
	employees e on m.emp_no= e.emp_no
where e.last_name = 'Markovitch'
order by e.emp_no, m.dept_no;

/*RIGHT OUTER JOIN 
same logic as left join but inverting tables*/
select * 
from dept_manager_dup;

select *
from department_dup;

select d.dept_no, d.dept_name, m.emp_no
from 
	dept_manager m
    right outer join department_dup d on d.dept_no = m.dept_no
order by d.dept_no;



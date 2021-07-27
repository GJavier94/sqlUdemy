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

use employees;

select dept_no from departments;

select * from departments;

select * from employees
where first_name = "Elvis";

select * from employees 
where first_name = 'Elvis' and gender = 'M';


select * from employees 
where first_name = 'Kellie' and gender = 'F';

select * from employees
where first_name = 'Kellie' or 'Aruna';


select * from employees where last_name = 'Denis' and (gender is not null);


select * from employees where (first_name = 'Kellie' or first_name = 'Aruna') and (gender = 'F');


select * from employees where first_name in ('Cathie','Mark', 'Nathan');

/*
faster than stablishing or's
*/
select * from employees where first_name in ('Cathie','Mark', 'Nathan');


select * from employees where first_name in ('Denis','Elvis');

select * from  employees where first_name not in ('John','Mark', 'Jacob');


select * from employees where first_name like('Mar%');
/*
%para una secuencia de caracteres Mar% 
_ para matching de un solo caracter Mar_
*/

select * from employees where first_name like('Mar_');

select * from employees where first_name like('Mar%');

#ES INSENSITIVO
select * from employees where first_name like('%MAR%');

# nada mar dadmardasd dasdamar
select * from employees where first_name not like('%Mar%');
#no contendra el substring mar

select * from employees where first_name like('Mark%') ;

select * from employees where hire_date like ('%2000%');

select * from employees where emp_no like('1000_');


select * from employees where first_name like('%jack%');
select * from employees where first_name not like('%jack%');

show databases;
use employees;


select distinct gender from employees;
#devuelve los distintos valores de ese campo
select distinct hire_date from employees;
#devuele los distntios valores del campo genero y luego los cuenta
select count( distinct gender) from employees;

#first_name valores distintos y luego los cuenta
select count(distinct(first_name)) from employees;


#ignoran los valores nulos a menos que se les diga qu eno los ignore
#1000 registros 900 nulos -> solo toma en cuenta los 900 y de ahi parte 

select  count(salary) from salaries where salary >= 100000;

select count(*) from dept_manager;



















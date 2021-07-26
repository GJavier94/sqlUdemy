select *, avg(salary) as average_salario
from salaries
group by emp_no;


select emp_no, avg(salary) as salario_anual
from salaries
group by emp_no
having salario_anual >= 120000;



#cuando agrupo se hace por campo de agrupacion
#ese campo es el que puedo usar 
#ejemplo emp_no de la tabla salarios 

SELECT
    emp_no, round(AVG(salary),2 ) as salario_promedio
FROM
     salaries
GROUP BY emp_no
HAVING salario_promedio > 120000
order by salario_promedio desc
limit 10;

show databases;
use employees;



select emp_no, avg(salary) as salario_por_anio
from salaries
group by emp_no
having salario_por_anio >= 120000;


CREATE VIEW Products_Above_Average_Price AS
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

 
CREATE VIEW emp_salario AS
select emp_no, avg(salary) as salario_por_anio
from salaries
group by emp_no;


select * from emp_salario
where salario_por_anio >= 120000
order by salario_por_anio desc
limit 10;

select * from salaries;




drop view if exists viewListNames;

CREATE or replace VIEW viewListNames AS
select first_name
from employees
where hire_date > '1999-01-01' and gender = 'F';



select first_name, count(first_name) as times_name
from viewListNames
group by first_name
order by first_name desc
limit 10;


select * 
from dept_emp
limit 100;











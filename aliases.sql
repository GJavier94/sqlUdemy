# aliases to change the column names 

SELECT 
    first_name, COUNT(first_name) as names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name desc;

#ejercicio 

select salary, count(salary) as emps_with_same_salary
from salaries
where salary >= 80000
group by salary
order by salary;



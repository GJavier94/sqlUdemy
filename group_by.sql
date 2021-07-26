SELECT 
    first_name, count(first_name)
FROM
    employees
GROUP BY first_name;

SELECT DISTINCT
    first_name
FROM
    employees;


SELECT 
    COUNT(first_name)
FROM
    employees
GROUP BY first_name;


SELECT 
    COUNT(first_name), first_name
FROM
    employees
GROUP BY first_name;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name;

/*
ORDEN
select columnames
from tablename
where conditiones
group by  column names
order by columnes names
*/

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name desc;

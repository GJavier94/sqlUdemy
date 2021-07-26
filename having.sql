#If an agregate functionis applied to dataset and then if we want to apply a filter 
#where is not allowed by mysql instead the comand is HAVING EXPRESSION

SELECT first_name, count(first_name) as conteo_nombres
from employees
group by first_name
having conteo_nombres > 250
order by first_name
;



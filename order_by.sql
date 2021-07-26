/*
de la tabla empleados muestra todas las columndas y ordenalos de forma ascdendente
*/
# los ordena por defecto en forma descendente
select * from employees order by first_name;

select * from employees order by birth_date desc;

#tambien se pueden ordenar por medio de usar varios campos
#1er criterio first_name -> cuando son iguales -> last name
select * from employees order by first_name, last_name;

select * from employees order by hire_date desc;














/*
ordenamieno de datos de forma ascendente 
*/
select * from employees order by first_name desc;


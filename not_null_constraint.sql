/* creamos la tabla  donde el nombre de la compañia no puede ser nulo*/
create table companies(
	company_id int auto_increment,
    headquarters_phone_number varchar(255),
    company_name varchar(255) not null,
primary key (company_id)
);

/*lo regresamos a nulo  no se puede alter column porque vamos a modificarlo no a borrarlo*/

alter table companies 
modify company_name varchar(255) null;

/* se puede cambiar de nulo a no nulo usando modify*/
alter table companies 
modify company_name varchar(255) not null;


/* se pudede utilizar change column para modificar los constraints de la columna al mismo
tiempo que le cambiamos el nombre a la columna*/

alter table companies 
change column company_name company_name_cambiado varchar(255) null;

alter table companies 
change column company_name company_name varchar(255) not null;


/*como el nombre de la compañia no puede ser nulo la siguiente insercion deberia mandar error*/

insert into companies(headquarters_phone_number)
values ('+1 (202) 555-0196');
/* Error Code: 1364. Field 'company_name' doesn't have a default value */

insert into companies(headquarters_phone_number, company_name)
values ('+1 (202) 555-0196', 'Company A');

select * from companies;

alter table companies
modify column headquarters_phone_number  varchar(255) null;

alter table companies
modify column headquarters_phone_number  varchar(255) not null;













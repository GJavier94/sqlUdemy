create database if not exists Sales;

show databases;

use Sales;


/*
Creating a table 
*/

create table Sales
(
	purchase_number INT NOT NULL PRIMARY KEY  AUTO_INCREMENT ,
    date_of_purchase DATE NOT NULL,
    customer_id INT NULL ,
    item_code VARCHAR(10) NOT NULL
    
);


/*
Creating a table  customers
*/


create table Customers(
	customer_id int ,
    first_name varchar(255) ,
    last_name varchar(255),
    email_address varchar(255) ,
    number_of_complaints int 
);

/*
Tambien se podia crear  con primary key al final 

*/
drop table sales;

create table sales
(
	purchase_number INT NOT NULL AUTO_INCREMENT ,
    date_of_purchase DATE NOT NULL,
    customer_id INT NULL ,
    item_code VARCHAR(10) NOT NULL,
PRIMARY KEY(purchase_number),
foreign key (customer_id) references customers(customer_id) on delete cascade
);


create table customers(
	customer_id int,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints varchar(255),
primary key (customer_id)
);

create table items(
	item_code varchar(255),
    item varchar(255),
    unit_price numeric(10,2),
    company_id varchar(255),
primary key(item_code)
);

create table companies(
	company_id varchar(255),
    company_name varchar(255),
    headquarters_phone_number int(12),
primary key(company_id)
);


drop table sales;
create table sales
(
	purchase_number INT NOT NULL AUTO_INCREMENT ,
    date_of_purchase DATE NOT NULL,
    customer_id INT NULL ,
    item_code VARCHAR(10) NOT NULL,
PRIMARY KEY(purchase_number)
);
/*
se puede alterar la tabla luego de la creacion con alter table 
*/
alter table sales
add foreign key (customer_id) references customers(customer_id) on delete cascade;

/*
se puede borrar la llave foranea con alter table 
*/

alter table sales
drop foreign key sales_ibfk_1;
/*
se puede agregar la llave foranea en mysql workbench
*/
drop table sales, customers, items, companies;
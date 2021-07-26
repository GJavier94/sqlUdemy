create table customers(
	customer_id int,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints varchar(255),
primary key (customer_id),
unique key (email_address)
);

drop table  customers;

create table customers(
	customer_id int,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints varchar(255),
primary key (customer_id)
);

/*
agregando constraint  unique key para email field usando alter table 
*/
alter table customers
add unique key (email_address);

alter table customers 
drop index email_address;


/*exercise*/
drop table customers;
create table customers(
	customer_id int,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints varchar(255),
primary key (customer_id)

);


alter table customers
add column gender ENUM('M','F') after last_name;


alter table customers
modify customer_id int auto_increment; 

insert into customers(first_name, last_name, gender, email_address,  number_of_complaints)
values ('john', 'mackinley', 'M', 'john.mchkinley@365careers.com', 0 );


select * from customers;


alter table customers
modify number_of_complaints int default 0;

select * from customers;



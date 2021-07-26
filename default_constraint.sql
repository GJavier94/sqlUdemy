/*
MODIFY COLUMN This command does everything CHANGE COLUMN can, but without renaming the column.
*/

drop table customers;

create table customers(
	customer_id int auto_increment,
    first_name varchar(255),
    last_name varchar(255),
    number_of_complaints int,
primary key(customer_id)
);

alter table customers
change column number_of_complaints number_of_complaints int default 0;


alter table customers
add column gender ENUM('M','F') after last_name;

/*
let's add a new records without number_of_complaints
*/


insert into customers(first_name, last_name, gender)
values ('peter', 'figaro', 'M');



select * from customers;


alter table customers
alter  column number_of_complaints  drop default ;

/* 
default constraint exercises 
*/

create table companies(
	company_id varchar(255),
    company_name varchar(255) default 'X',
    headquarters_phone_number varchar(255),
primary key (company_id),
unique key (headquarters_phone_number)

);

drop table companies;




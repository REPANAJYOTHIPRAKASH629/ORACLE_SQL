-- creation of city table
-- parent table
create table city 
( 
city_id number(4), 
city_name varchar2(30) 
);

-- inserting values to the city table
insert into city values (10,'Chennai'); 
insert into city values (20,'Pune'); 
insert into city values (30,'Hyd'); 
insert into city values (40,'Delhi')

-- checking the values are inserted to the city table or not?
select * from city;

-- commiting the values for future usage
commit;

-- altering the city_id as primary key
alter table city add primary key(city_id);

-- creation of customer table
-- child table
create table customer 
( 
cust_id number(6) primary key, 
cust_name varchar2(30) not null, 
mobile_no number(10) unique check (length(mobile_no)=10), 
age number(3) check (age>=18), 
city_id number(4) references city(city_id) -- on delete cascade  
);

-- 
select * from customer; 


-- inserting values to the customer table
insert into customer values (100000,'Arun',9090909090,28,20); 

-- checking with same record of the data so that our contraints are working or not 

--insert into customer values (100000,'Arun',9090909090,28,20); 

--                          Error
-- insert into customer values (100000,'Arun',9090909090,28,20)
-- Error report -
-- ORA-00001: unique constraint (CORE.SYS_C007001) violated
-- -----------------------------------------------------------------------------

insert into customer values (100001,'Arun',8080808080,31,30); 
-- ORA-00001: unique constraint (CORE.SYS_C007001) violated


insert into customer values (100002,'Vijay',5050505050,31,10); 


insert into customer values (100003,'Ajith',2894738243,13,30); -- Error is age < 18 


insert into customer values (100004,'Ramesh',2894738789,31,60); -- Error is not having the 60 which is not in city_id in city table 

commit;

desc customer;

select * from customer;

-- to check all the constraints with 
select * from all_constraints where owner='CORE' and table_name='CUSTOMER';


select * from all_cons_columns where owner='CORE' and table_name='CUSTOMER'; 


select 
a.owner,a.constraint_name,a.constraint_type,b.table_name,b.column_name 
from all_constraints a , all_cons_columns b 
where a.constraint_name=b.constraint_name  
and a.owner='HR' and a.table_name='CUSTOMER'; 


-- deleting a record where cust_id = 100002 which is reference table
delete from customer where cust_id = 100002; 

delete from city where city_id=30;
-- ERROR 
-- ORA-02292: integrity constraint (CORE.SYS_C007003) violated - child record found

-- if you need to delete above one 
delete from customer where city_id=30;

rollback;

select * from all_constraints where owner='CORE' and table_name='CUSTOMER';

alter table customer
drop constraint SYS_C007003;

-- altering the customer table to on delete cascade
-- on delete cascade is used to delete the records, 
-- when the parent primary key valse has deleted means the child records are also be deleted automatically

ALTER TABLE customer  
ADD CONSTRAINT city_fk  
FOREIGN KEY (city_id)  
REFERENCES city(city_id)  
ON DELETE CASCADE;

select * from city;

select * from customer;

delete from city where city_id=30;


--Metadata tables will have all table & column level details
select * from all_tables where owner='CORE';


-- after altering we are checking that if that has disabled or not
select * from all_constraints where owner='CORE' and table_name='CUSTOMER';

select * from all_tab_columns where owner='CORE' and column_name='CITY_ID'; 

drop table city;

drop table customer;


--          composite key
create table customers
( 
cust_id number(6), 
cust_name varchar2(30) not null, 
mobile_no number(10), 
age number(3) check (age>=18), 
city_id number(4) references city(city_id), 
primary key(cust_id,mobile_no) --composite key
);

-- composite key using (cust_id,mobile_no)
insert into customers values (100000,'Arun',9090909090,28,20); 
insert into customers values (100000,'Arun',9090909091,28,20); 
insert into customers values (100000,'Arun',9090909090,28,20); -- Error is repreated same values in (cust_id,mobile_no)
insert into customers values (100001,'Arun',9090909091,28,20); 

select * from customers;  



create table country 
( 
cust_country_code varchar2(2) primary key, 
country_name varchar2(30) 
);


insert into country values('IN','India'); 
insert into country values('US','USA');
insert into country values('IN','USA'); -- ORA-00001: unique constraint (CORE.SYS_C007015) violated

drop table country; 



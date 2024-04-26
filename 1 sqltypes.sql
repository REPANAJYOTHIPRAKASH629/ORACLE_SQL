create table customer
(
cust_id number(8),
cust_name varchar2(100),
mobile number(10),
dob date,
city varchar2(100),
email_id varchar2(100)
);


select * from customer;

desc customer;

insert into customer 
(cust_id, cust_name, mobile, dob, city, email_id)
values
(
10000, 'prakash', 8310692638, to_date('17/04/2024', 'dd/mm/yyyy'), 'chennai', 'prakash629@gmail.com'
);


insert into customer 
(cust_id, cust_name, mobile, dob, city, email_id)
values
(
10001, 'jyothi', 8310692638, to_date('17/04/2024', 'dd/mm/yyyy'), 'banglore', 'prakash629@gmail.com'
);

insert into customer 
(cust_id, cust_name, mobile, dob, city, email_id)
values
(
10002, 'repana', 8310692638, to_date('17/04/2024', 'dd/mm/yyyy'), 'hyderabad', 'prakash629@gmail.com'
);

insert into customer 
(cust_id, cust_name, dob, city, email_id)
values
(
10002, 'repana', to_date('17/04/2024', 'dd/mm/yyyy'), 'hyderabad', 'prakash629@gmail.com'
);


update customer 
set mobile=9742826403 where cust_id=10002;


commit;


rollback;


-- adding a counrty column to customer table

alter table customer
add country varchar(50);


update customer set country='India';


-- droping a column
alter table customer
drop column city;

select * from customer;

rollback;


desc customer;


alter table customer
modify cust_id number(10);


create table customer_bkp as select *from customer;


create table customer_bkp1 as select *from customer where 1=2;


select * from customer_bkp;


truncate table customer;


select * from customer;


insert into customer(select * from customer_bkp);


commit;


select * from customer_bkp;


rollback;


delete from customer_bkp where cust_id=100000;


commit;


drop table customer_bkp;

-- -----------rename------------

alter table customer 
rename column mobile to mobile_no;


alter table customer 
rename column dob to date_of_birth;


select * from customer;



-- ------------savepoint example--------------

create table customer_test (no1 number(3), no2 number(3));


select * from customer_test;


insert into customer_test values(1,2);

insert into customer_test values(3,4);

insert into customer_test values(5,6);

insert into customer_test values(7,8);

select * from customer_test;

rollback;

insert into customer_test values(1,2);
savepoint a;
insert into customer_test values(3,4);
savepoint b;
insert into customer_test values(5,6);
savepoint c;
insert into customer_test values(7,8);
save point d;

select * from customer_test;


rollback to c;


select * from customer_test;










select * from employees;


select employee_id,first_name,email,hire_date,salary,department_id from employees;


-- column alias
select employee_id as associate_id,first_name,email,hire_date,salary,department_id from employees;


-- another way for aliasing
select employee_id associate_id,first_name,email,hire_date,salary,department_id from employees;


-- column concatination
select employee_id associate_id,first_name, last_name, concat(first_name, last_name) as fullname,email,hire_date,salary,department_id from employees;


-- nested function of concat
select employee_id associate_id,first_name, last_name, concat(concat(first_name,' ') ,last_name) as fullname,email,hire_date,salary,department_id from employees;

-- another way with pipesymbol
select employee_id associate_id,first_name, last_name, first_name||' '||last_name fullname,email,hire_date,salary,department_id from employees;


-- COLUMN CALCULATION
select employee_id,first_name,email,hire_date,salary,salary+1000 new_salary,department_id from employees; 


select employee_id,first_name,email,hire_date,salary,salary*12 annual_salary,department_id from employees; 


select * from employees;


select department_id from employees;


select count(department_id) from employees; 


select distinct department_id from employees;


select count(distinct department_id) from employees;


select count(*) from ( select distinct department_id,job_id from employees);




-- where clause
select * from employees where salary > 10000;


select * from employees where salary <3000;


select * from employees where salary >5000 and salary <7000; 


select * from employees where salary >=5000 and salary <=7000; 

-- another way >=, <=  or between/and
select * from employees where salary between 5000 and 7000; 


select * from employees where salary not between 5000 and 7000; 


select * from employees where department_id=30;


select * from employees where department_id=30,60,90; -- error


select * from employees where department_id IN(30,60,70);


select * from employees where department_id not IN(30,50,80);


select * from employees where job_id IN('MK_MAN', 'IT_PROG', 'AD_VP');


select * from employees where department_id=80 AND salary >10000; 


select * from employees where department_id=60 OR salary >15000; 


select * from employees where department_id=60 OR (department_id=80 AND salary >10000);


select rownum, rowid from employees;


select rownum,rowid,e.* from employees e;


select rownum,rowid,employees.* from employees; 


select * from employees where rownum <= 5; -- always works with < or <= only


select * from employees where commission_pct is null; 


select * from employees where commission_pct is not null; 


select count(*) from employees where commission_pct is not null; 


select count(*) from employees where commission_pct is null; 


select count(commission_pct) from employees; 


select employee_id,hire_date,to_char(hire_date,'yyyy') from employees; 


select employee_id,hire_date,to_char(hire_date,'yyyy'),to_char(hire_date,'mm') from employees; 


select employee_id,hire_date,to_char(hire_date,'yyyy'),to_char(hire_date,'mm'), to_char(hire_date,'Mon'), to_char(hire_date,'Month'), to_char(hire_date,'dd'), to_char(hire_date,'Day') from employees; 


select * from employees where to_char(hire_date,'yyyy')='2005'; 


select * from employees where to_char(hire_date,'mmyyyy') between '092005' and '092006'; 


select * from employees where to_char(hire_date,'mm')='02';


select * from employees where to_char(hire_date,'mmyyyy')='032005'; 


select * from employees where to_char(hire_date,'FMDay')='Monday'; 


select * from employees where to_char(hire_date,'D')='2'; 


select * from employees;




-- dummy table as dual
select * from dual; -- dummy table with no data


select sysdate from dual;  -- current date


select current_date from dual;  -- today's date


select sysdate from employees; -- current date


select sysdate+10 from employees;  -- +10 days


select sysdate-10  from employees; -- -10 days


select systimestamp from dual;  -- in my system systimestamp is  date/time/AM/PM/TimeZone ex : 21-04-24 6:43:16.077000000 AM +05:30


select trunc(systimestamp) from dual;


-- pattern matching (like)
select * from employees where first_name like 'A%'; 


select * from employees where first_name like 'a%'; 


select * from employees where upper(first_name) like 'J%'; 


select * from employees where first_name like '%s'; 


select * from employees where first_name like '%an%'; 


select * from employees where first_name like 'S%n'; 


select * from employees where first_name like '_______'; 


select * from employees where length(first_name) =7;


select * from employees where first_name like '_a____'; 


select * from employees where first_name like '_a_t__'; 


select * from employees where first_name like 'A%' and salary like '%200'; 


select * from employees where salary like'__5__';


select * from employees where salary like'__500';


select * from employees where first_name like '%\_%' escape '\'; 


-- Sorting -- Order by asc | desc 
select * from employees;


select ascii('A') from dual; -- 65


select ascii('a') from dual; --97


select * from employees order by first_name; 


select * from employees order by first_name desc; 


select * from employees order by salary asc; 


select * from employees order by salary desc;

-- order by more than one column
select * from employees order by salary desc,hire_date;


select * from employees order by 8 desc,6; -- instead of column name we can check with the column number


select * from employees order by 3;


select employee_id, first_name, email, salary from employees order by 3;

-- null treated as highest value 
select * from employees order by commission_pct;


select * from employees order by commission_pct desc; 






















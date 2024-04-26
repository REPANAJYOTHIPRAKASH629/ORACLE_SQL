-- Single Row Functions 

-- upper
-- lower
-- initcap
-- length
-- reverse
select first_name,upper(first_name),lower(first_name),initcap(first_name), length(first_name),reverse(first_name) from employees;


select * from employees where first_name='JOHN';


select * from employees where first_name='John';


select * from employees where first_name='john';


select * from employees where first_name='John' OR first_name='JOHN' OR first_name='john';


select * from employees where upper(first_name)='JOHN';



-- Substr  --sub string 
substr(string,from_position,no_of_char);    -- 3 argument 
substr(string,from_position);    -- 2 argument 

select substr('Welcome to India!!!',12,5) from dual; 


select substr('Welcome to India!!!',12) from dual; 


select substr('Welcome to India!!!',-8) from dual; 


select substr('Welcome to India!!!',-8,5) from dual; 


select job_id,substr(job_id,1,4) from employees;


-- Instr will return the position of the character 
select INSTR('CORPORATE FLOOR','R') from dual; 


select INSTR('CORPORATE FLOOR','R',1,3) from dual; 


select INSTR('CORPORATE FLOOR','AB') from dual;


-- from 3rd position 2nd occurrence 
select INSTR('CORPORATE FLOOR','OR',3,2) from dual;


select INSTR('CORPORATE FLOOR','OR',3) from dual;


Insuranc~200

HR~430


select substr('Insurance~200',1,9) from dual;


select instr('Insurance~200','~') from dual


select substr('Insurance~200',1,instr('Insurance~200','~')-1) from dual;


select substr('Insurance~200',1,instr('Insurance~200','~')-1) from dual;


select substr('HR~430',1,instr('HR~430','~')-1) from dual;


select substr('Insurance~200',instr('Insurance~200','~')+1) from dual;


select substr('HR~430',instr('HR~430','~')+1) from dual;


select substr('sample@gmail.com', 1, instr('sample@gmail.com', '@')-1) from dual;


select substr('jyothiprakash@gmail.com', 1, instr('jyothiprakash@gmail.com', '@')-1) from dual;



-- LPAD
select LPAD('WELCOME',15, '*') from dual;


select RPAD('WELCOME',15, '*') from dual;


select LPAD(RPAD('WELCOME',15, '*'),30,'*') from dual;


select salary, LPAD(salary,12,0) from employees;


-- trim
select LTRIM('  Welcome') from dual; 


select RTRIM(' Welcome ') from dual; 


select TRIM(' Wel come      ') from dual; 


select REPLACE(TRIM(' Wel come      '),'','') from dual; 


select LTRIM('00000000000100123', '0') from dual; 


select LTRIM('00101233234345354650121211', '021') from dual; 


select RTRIM('00101233234345354650121211', '021') from dual; 


select LTRIM(RTRIM('00101233234345354650121211', '021'),'021') from dual;


select REPLACE('JACK and JUE','J','BL') from dual;


select REPLACE(upper(JOB_ID),'MAN','BOSS') from EMPLOYEES; 


select phone_number ,'+91-'||replace(phone_number,'.',null) from employees;


select phone_number ,'+91-'||substr(replace(phone_number,'.',null),1,5)||'-'||substr(replace(phone_number,'.',null),6,5) mobile_no from employees;


-- translate --> position wise translation
select translate('WELCOME TO CHENNAI','ABCDEF','WXYZ') from dual; 


-- Dealing with Null values: 
-- Any arithmatic operations on null values results null 
value*null ==> null 
value+null ==> null 
value-null ==> null


select * from employees;


select employee_id, first_name, salary, commission_pct,salary+(salary*commission_pct) totalsalary from employees;


-- to deal null values we have 4 functions 
NVL   - 2 arg 
NVL2  - 3 arg 
Nullif - 2 arg 
Coalesce  - n arg 


NVL(arg1,arg2) 
if arg1 is null ---> arg2 
if arg1 is not null --> arg1 


select NVL(5,6) from dual;  -- 5 


select NVL(null,6) from dual; --6 


select NVL(null,null) from dual;


select employee_id,salary,commission_pct,salary+(salary*commission_pct) total_salary from employees; 


select employee_id,salary,commission_pct,salary+(salary*nvL(commission_pct,0)) total_salary from employees; 


-- NVL2
NVL2(arg1,arg2,arg3) 
if arg1 is null ---> arg3 
if arg1 is not null --> arg2


select nvl2(4,8,12) from dual;  --8 


select nvl2(null,8,12) from dual; -- 12 


-- nullif
nullif(arg1,arg2) 
if arg1=arg2   ---> null 
if arg1 != arg2   ---> arg1 


select nullif(5,8) from dual; --5 


select nullif(8,8) from dual; -- null 


select first_name,last_name from employees where first_name=last_name; 


select first_name,last_name from employees where nullif(first_name,last_name) is null;




-- coalesce
coalesce(arg1,arg2,arg3.. ..arg_n) -- It will return first not null value 
COALESCE  -- It will always return first not null value


select commission_pct,manager_id,department_id from employees;


select commission_pct,manager_id,department_id, COALESCE(commission_pct,manager_id,department_id,0) from employees; 


select employee_id,salary,commission_pct,salary+(salary*COALESCE(commission_pct,0)) total_salary from employees; 


--round

select  round(0.7) from dual; 


select  round(2.8) from dual; 


select  round(4.35) from dual; 


select  round(5435.7878) from dual; 


select  round(5435.3878) from dual;


select  round(5435.7878,2) from dual; 


select  round(5435.9978,2) from dual; 


select  round(5435.783258,3) from dual; 


select  round(5435.783258,4) from dual; 


select  round(5434.7878,-1) from dual; 


select  round(5435.7878,-1) from dual; 


select  round(5475.7878,-2) from dual; 



-- Trunc will always take base value 
select  trunc(0.7878) from dual; 


select  trunc(5435.7878) from dual; 


select  trunc(5435.3878) from dual; 


select  trunc(5435.7878,2) from dual; 


select  trunc(5435.783258,3) from dual; 


select  trunc(5435.783258,4) from dual; 



-- it will remove timestamp from a date&time, returns date part alone 
select SYSTIMESTAMP from dual; 


select trunc(SYSTIMESTAMP) from dual; 


ceil  -- always top value 
Floor -- Always base value 
select floor(5.99999999) from dual; 


select floor(5.000000999) from dual; 


select ceil(5.99999999) from dual; 


select ceil(5.000000001) from dual;


-- what is the difference between trunc and floor? 
-- mod returns reminder in the division operation 
select mod(55,4) from dual;    -- 55/4 reminder 3 


select mod(55,3) from dual;   --55/3   reminder 1 -- leap year of hire_date 


select * from employees where mod(to_char(hire_date,'yyyy'),4)=0; 


select * from employees where mod(to_char(hire_date,'yyyy'),4)!=0; 


-- even number of employee_id 
select * from employees where mod(employee_id,2)=0;


-- months between two dates -- MONTHS_BETWEEN(date1,date2) 
select  MONTHS_BETWEEN (TO_DATE ('2020/01/01', 'yyyy/mm/dd'), TO_DATE ('2010/01/01', 'yyyy/mm/dd') ) total_months from dual; 


select months_between(sysdate, TO_DATE ('2000/01/01', 'yyyy/mm/dd')) from dual; 


select round(months_between(sysdate, TO_DATE ('2000/01/01', 'yyyy/mm/dd'))) from dual; 


-- days between two dates 
select date2 - date1 total_days from dual; -- syntax


select TO_DATE ('2017/01/01', 'yyyy/mm/dd')- TO_DATE ('2014/01/01', 'yyyy/mm/dd') from dual;


-- next weekday of given date 
select NEXT_DAY('31-Mar-20', 'FRIDAY') from dual;


select next_day(sysdate,'Thursday') from dual


-- last day of given month 
select LAST_DAY(sysdate) from dual;


select LAST_DAY(sysdate+25) from dual; 


--sysdate=last_day(sysdate)  -- add_months(date,number_of_months)  
select ADD_MONTHS('01-Aug-03', 3) from dual; 


select ADD_MONTHS(sysdate, 60) from dual; 





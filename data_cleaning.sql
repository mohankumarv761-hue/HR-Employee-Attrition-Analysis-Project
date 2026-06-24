use employee_attrition;
#check tables after import
show tables;

#structure and schema of the table
describe employee;
describe performance;

# rename column name
alter table employee
rename column ï»¿Employee_ID to Employee_ID;

alter table performance
rename column ï»¿Performance_ID to Performance_ID;

#check records from tables 
 select*from employee limit 10;
 select*from performance limit 10;
 
#combine first_name and last_name as full_name
alter table employee
add column full_name varchar(60);
update employee set full_name=concat(firstname," ",lastname);

#change date datatype from text to date
alter table employee
add column hire_date1 date;

update employee set hire_date1=str_to_date(hire_date,'%d-%m-%Y');

alter table performance
add column review_date1 date;

update performance
set review_date1=str_to_date(review_date,'%d-%m-%Y');
select review_date1 from performance limit 10;

 alter table employee
 rename column hire_date1 to hire_date;
 
 alter table performance
 rename column review_date1 to review_date;
 
alter table employee
rename column hire_date1 to hire_date;
 
alter table performance
rename column review_date1 to review_date;

select hire_date1 from employee limit 10;
 
 #drop unwanted columns
 alter table employee
 drop column firstname,
 drop column lastname,
 drop column ethnicity,
 drop column maritalstatus,
 drop column stockoptionlevel,
 drop column education_qualification,
 drop column hire_date,
 drop column review_date;
 

#update employee qualification by degree
select education_qualification from employee
group by education_qualification;

alter table employee
add column qualification varchar(30);
update employee
set qualification=
case 
when education_qualification=5 then "Doctrate"
when education_qualification=4 then "Master's Degree"
when education_qualification=3 then "Bachelor's Degree"
when education_qualification=2 then "High School"
when education_qualification=1 then "No Formal Qualification"
end;
select qualification from employee
group by qualification;

#create cte and view for recent review data on performance table

create view view_review as
with recent_review as
(select *,
row_number() over(partition by employee_id order by review_date desc) as r
from performance)

select*from recent_review where r=1;

select*from employee limit 10;
select*from performance limit 10;
select*from view_review limit 10;



 


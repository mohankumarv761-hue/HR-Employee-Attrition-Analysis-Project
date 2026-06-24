use employee_attrition;

select*from employee limit 10;
select*from performance limit 10;
select*from view_review limit 10;

select count(*) from view_review;
select count(*) from employee;

#count of employee who didn't give their review from each depaartment
select count(*) as not_reviewed from
employee e left join performance p 
on e.employee_id=p.employee_id
where p.employee_id is null;

select e.department, count(*)as number_of_employees from employee e left join view_review r on e.employee_id=r.employee_id
where r.employee_id is null
group by e.department order by count(*)desc;


#count of attrition and active employees
select count(*)as total_employee,
count(case when attrition='no' then 1 end)as active_employees,
count(case when attrition='yes' then 1 end)as attrition_employees,
round(sum(case when attrition='yes' then 1 end)/count(*)*100,2)as attrition_percentage
from employee;



#attrition analysis based on department and job role
select department,count(*)as total_employees,
count(case when attrition='yes' then 1 end)as attrition_count,
round(sum(case when attrition='yes' then 1 end)/count(*)*100,2)as attrition_percentage from employee
group by department
order by attrition_percentage desc;

select department,job_role,count(employee_id)as employee_count,
sum(case when attrition='yes' then 1 else 0 end)as attrition_count,
round(sum(case when attrition='yes' then 1 else 0 end)/count(employee_id)*100,2)as attrition_percentage
from employee
group by department,job_role
order by department asc,attrition_percentage desc;

#gender-wise attrition analysis
select gender,count(*)as total_count,
count(case when attrition='yes' then 1 end)as attrition_count,
round(count(case when attrition='yes' then 1 end)/count(*)*100,2)as attrition_percentage
from employee
group by gender
order by attrition_percentage desc;

#attrition analysis based on overtime
select over_time,count(*)as total_count,
count(case when attrition='no' then 1 end )as active_employees,
count(case when attrition='yes' then 1 end)as attrition_employees,
round(count(case when attrition='yes' then 1 end)/count(*)*100,2)as attrition_rate,
round(count(case when attrition='no' then 1 end)/count(*)*100,2)as active_rate
from employee
group by over_time
order by attrition_rate desc;

#attrition employees coount who got salary less than average salary and doing overtime
select department,job_role,round(avg(salary),2)as average_salary,count(*)as attrition_count
from employee
where salary<(select round(avg(salary),2) from employee) and attrition='yes' and over_time='yes'
group by department,job_role
order by department,attrition_count desc;


#attrition analysis based on overtime and salary
select job_role,attrition,count(*)as employee_count,round(avg(salary),2)as average_salary,
sum(case when over_time='yes' then 1 end)as overtime_employees,
round(count(case when over_time='yes' then 1 end)/count(*)*100,2)as overtime_percentage
from employee
group by job_role,attrition
order by job_role,attrition desc;


#analysis attrition based on manager rating
select r.manager_rating,e.department,count(e.employee_id)as total_count,
sum(case when attrition='yes' then 1 end)as attrition_count,
round(sum(case when e.attrition='yes' then 1 end)/count(e.employee_id)*100,2)as attrition_percentage
from employee e join view_review r
on e.employee_id=r.employee_id
group by r.manager_rating,e.department
order by manager_rating asc,attrition_percentage desc;

#attrition rate analysis whose done overtime and have a poor worklife balance rating
select e.department,e.job_role,
count(case when e.attrition='yes' and e.over_time="yes" and r.work_life_balance<3 then 1 end)as attrition_count,
round(count(case when e.attrition='yes' and e.over_time='yes' and r.work_life_balance<3 then 1 end)/count(*)*100,2)as attrition_rate
from employee e join view_review r
on e.employee_id=r.employee_id
group by e.department,e.job_role
having count(case when e.attrition='yes' and e.over_time="yes" and r.work_life_balance<3 then 1 end)>0
order by e.department asc,attrition_rate desc;

#Attrition rate by tenure
select years_at_company,count(*) as total_employees,
count(case when attrition='yes' then 1 end)as attrition_count,
round(count(case when attrition='yes' then 1 end)/count(*)*100,2)as attrition_rate
from employee
group by years_at_company
order by attrition_rate desc;






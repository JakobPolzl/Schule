--1
select department_name, city
from locations inner join departments on locations.location_id = departments.location_id
where city LIKE 'Toronto';

--2
select city
from locations 
where not location_id in (select location_id from departments);

--3
select first_name, job_history.start_date, end_date, jobs.job_title, departments.department_name
from employees inner join job_history on employees.employee_id = job_history.employee_id
inner join jobs on job_history.job_id = jobs.job_id
inner join departments on job_history.department_id = departments.department_id
where employees.employee_id like '101';

--4
select first_name, last_name, job_title
from employees inner join jobs on employees.job_id = jobs.job_id;

--5
select jobs.job_title, count(employees.employee_id)
from jobs left join employees on jobs.job_id = employees.job_id
group by jobs.job_title;

--6
select locations.location_id, count(departments.department_id)
from locations left join departments on locations.location_id = departments.location_id
group by locations.location_id;
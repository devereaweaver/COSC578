-- For each deparment, retreive the department names, and total 
-- salary of employees working in that department

-- aggregate the salary's by dno first 
select dno, sum(salary)
from employee e, department d
group by dno;

select department_name
from department
where 
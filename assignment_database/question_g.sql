-- For each deparment, retreive the department names, and total 
-- salary of employees working in that department

select dname, sum(salary) 
from department d, employee e
where e.dno = d.dnumber
group by d.dnumber;
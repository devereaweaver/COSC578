-- Retreive the total salary of all female employees.

select sum(salary)
from employee
where sex = 'F';
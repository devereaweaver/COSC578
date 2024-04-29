-- List the names of employees who have a dependent with the same 
-- first name as themselves. 

select fname, minit, lname
from employee, dependent
where employee.fname = dependent.dependent_name;
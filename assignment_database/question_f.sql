-- Retrieve the name of employees who do not work on any project

-- find the ESSN of all employees who worked on a project
select fname, minit, lname 
from employee 
where ssn not in (
	select essn 
    from works_on
);
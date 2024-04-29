-- Retrieve the names of employee in department 5 who work more than 10 hours per
-- week on the ‘ProductX’ project.

-- use a nested query to find the employee ids that worked 
-- on product x with more than 10 hours, then match those 
-- to names in the employee table who are in department 5
select fname, minit, lname
from employee 
where ssn in (
	select essn 
	from works_on w, project p
	where w.pno = p.pnumber
		and p.pname = 'ProductX'
		and w.hours > 10
	)
    and dno = 5;
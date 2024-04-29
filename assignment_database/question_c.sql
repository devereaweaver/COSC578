-- find the names of Franklin Wong's supervisor. 

-- find franklin's superssn first, then use nested
-- query to find that person's name
select fname, minit, lname
from employee
where ssn = (
	select superssn
	from employee
	where fname = 'Franklin' AND
		lname = 'Wong'
);
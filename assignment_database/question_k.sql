-- Find the names of employees and the names of the projects they
-- are working on.

select fname, minit, lname, pname
from works_on w, project p, employee e
where w.pno = p.pnumber 
	AND e.ssn = w.essn;
	 
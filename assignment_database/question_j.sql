-- List the names of department managers who have dependents. 
select fname, minit, lname 
from employee e, department d
where d.mgrssn in (
	select ssn 
	from employee e, dependent d
	where e.ssn = d.essn)
    AND e.ssn = d.mgrssn;
    

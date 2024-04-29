-- Find the names of employees who are working on the project 
-- that is not controlled by the emloyeees own department.
select fname, minit, lname 
from employee, project, works_on 
where ssn = essn 
and pnumber = pno 
and dnum != dno;

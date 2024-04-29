-- find the names and addresses of employees who work on at least one
-- project located in houston but whose department has no location in Htown. 

select fname, minit, lname, address
from employee e
join works_on w on e.ssn = w.essn
join project p on w.pno = p.pnumber
where p.plocation = 'Houston'
  and e.dno not in (
    select d.dnumber
    from department d, dept_locations l
    where d.dnumber in (
		select l.dnumber
			where dlocation != 'Houston'
    )
  );
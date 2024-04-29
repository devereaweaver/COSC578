-- For each project, list the project name and the total hours
-- per week by all employees spend on that project

select pname, SUM(hours) 
from project p, works_on w
where p.pnumber = w.pno
group by p.pname;
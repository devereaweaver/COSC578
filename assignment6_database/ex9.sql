-- Get job numbers for jobs whose city is first in the alphabetical list of 
-- the jobs cities.

select j.j_num 
from j 
where j.city = (
select min(j.city)
from j
order by j.city
);
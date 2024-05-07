-- Among parts that are used in projects, find out the most used parts in each project.
-- TODO: Work on this later

-- get the parts used in each project 
select distinct j_num, p_num, max(qty)
from spj
group by j_num, p_num
order by j_num, max(qty);

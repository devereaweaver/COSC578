-- Get supplier numbers and names for suppliers whose status is greater than status values
-- of all suppliers in located Paris.

select s.s_num, s.s_name
from s 
where s.status > (
select max(s.status)
from s 
where s.city = 'Paris'
);
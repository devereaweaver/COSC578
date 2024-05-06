-- Get supplier names and numbers for all suppliers who supplied part P3 and whose
-- name begins with letter A.

select s.s_num, s.s_name 
from s
where s.s_num in (
select spj.s_num 
from spj
where spj.p_num = 'p3'
)
and s.s_name like 'A%';
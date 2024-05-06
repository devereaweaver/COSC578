-- Get supplier names for suppliers who supplied parts for jobs only in Athens. (Use a
-- nested query)

select s.s_name
from s 
where s.s_num in (
select spj.s_num 
from spj 
where spj.j_num in (
	select j.j_num 
	from j
	where j.city = 'Athens'
	)
);
-- Get supplier names for suppliers who supplied for job J2. (Use a nested query)


select s.s_name 
from s
where s.s_num in (
	select spj.s_num 
	from spj
	where spj.j_num = 'j2'
	);
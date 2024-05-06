-- Get supplier names and numbers for all suppliers whose name (supplier name) begins
-- with letter A and who supplied parts whose name (part’s name) begins with setter S.

select s.s_num, s.s_name
from s
where s.s_num in (
	select spj.s_num
	from spj 
	where spj.p_num in (
		select p.p_num
		from p
		where pname like 'S%'
	)
);
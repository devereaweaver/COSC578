-- Calculate each supplier’s total sales quantity and get the sales person’s name if the
-- sales person supplies parts more than 1000 units in total.


select s.s_name 
from s 
where s.s_num in (
	select spj.s_num
	from spj
	group by spj.s_num
	having sum(spj.qty) > 1000
	);


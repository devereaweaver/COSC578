-- Smith moved to Adam’s location. Please update Smith’s city but do not use the city
-- name directly.
-- COME BACK TO FINISH THIS ONE

set sql_safe_updates = 0;
update s
set s.city = (
	select s.city 
 	from s
	where s.s_name = 'Adams'
)
where s.s_name = 'Smith';

select * from s;
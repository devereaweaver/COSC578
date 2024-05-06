-- Change the name to ‘Hammer’ of parts that are Red and located in London and whose
-- name was Screw.

set sql_safe_updates = 0;
update p
set p.pname = 'Hammer'
where p.color = 'Red'
	and p.city = 'London'
    and p.pname = 'Screw';
-- set sql_safe_updates = 1;

select * from p;
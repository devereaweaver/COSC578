-- Delete all jobs in Rome and all corresponding part shipments. (Please use 2 queries)

-- drop j_num column from spj before deleting the jobs columns in j 
-- assuming this means just delete the entire record? 
set sql_safe_updates = 0;
delete from spj
where spj.j_num in (
	select j.j_num 
	from j 
	where j.city = 'Rome'
);

select * from spj;

delete from j 
where j.city = 'Rome';

select * from j;
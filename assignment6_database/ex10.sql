-- Increase the status values of suppliers by 5 who are located in Paris.
-- Please hand in the modified table and the query. 
set sql_safe_updates = 0;
update s
set s.status = (s.status + 5)
where s.city = 'Paris';

select * from s;
-- Get part names for parts that are not supplied for job j3. 

select p.pname
from p
where p.p_num not in (
select spj.p_num
from spj
where spj.j_num = 'j3'
);


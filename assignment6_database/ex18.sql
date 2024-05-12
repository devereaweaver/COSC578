-- Among parts that are used in projects, find out the most used parts in each project.

select a.j_num, a.p_num, a.b
from (select j_num, p_num, sum(qty) as b
     from spj
     group by j_num, p_num
     ) as a
where a.b = (select max(d.c)
            from (select j_num, p_num, sum(qty) as c
                  from spj
                  group by j_num, p_num
                  ) as d
            where d.j_num = a.j_num
            );
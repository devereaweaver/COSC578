-- Which city has the most suppliers? (Use a nested query)

select a.city, a.supplier_count
from (select city, count(s_num) as supplier_count     
             from S      
             group by city) as a
where a.supplier_count = (select MAX(b.c)            
                       from (select count(s_num) as c                  
                                    from s                  
                                      group by city) as b);
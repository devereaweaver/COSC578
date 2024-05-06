-- Please create a “view table” supplier_shipment that shows each supplier and its total
-- shipment quantity. 

-- I rebuilt the tables so the values match the original table values.:w
create view supplier_shipment as
select spj.s_num, sum(spj.qty) as total_qty
from spj 
group by spj.s_num;

select * from supplier_shipment;

drop view supplier_shipment;
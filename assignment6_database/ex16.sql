-- Please create a base table supplier_shipment that shows each supplier and its total
-- shipments from S and SPJ tables.

create table supplier_shipment as
select spj.s_num, sum(spj.qty) as total_qty
from spj 
group by spj.s_num;

select * from supplier_shipment;

drop table supplier_shipment;
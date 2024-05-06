-- Repeat question 15

update supplier_shipment as ss
set ss.total_qty = (ss.total_qty + 100) 
where ss.s_num in ( 
	select s.s_num 
    from s 
    where s.s_name = 'Smith'
);

select * from supplier_shipment;
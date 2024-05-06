-- Please try to increase Smith’s total shipment by 100 in the view table you created in
-- question 14. Then discuss what happens when you try to update the view table. 

update supplier_shipment as ss
set ss.total_qty = (ss.total_qty + 100) 
where ss.s_num in ( 
	select s.s_num 
    from s 
    where s.s_name = 'Smith'
);

-- We're not allowed to update a view table since it is not an actual table in the schema, 
-- it is merely a computed set of tuples with values from different tables in the schema.
-- Attemtpting to update the view table would mean making unintended updates to the underyling 
-- tables. 

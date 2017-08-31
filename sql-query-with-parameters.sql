declare @minsales bigint
set @minsales = 500000000000

select * from customer
	where id in 
		(select Customerid from sales 
			where salesytd > @minsales)
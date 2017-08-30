insert into Sales
	select Name, SalesYTD, 'A' as 'ABC' from customer
		where SalesYTD > 1000000000
	union
	select Name, SalesYTD, 'B' as 'ABC' from customer
		where SalesYTD <= 1000000000 and SalesYtd > 50000
	union
	select Name, SalesYTD, 'C' as 'ABC' from customer
		where SalesYtd <= 50000


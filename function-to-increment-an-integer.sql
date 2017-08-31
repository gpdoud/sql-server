alter function inc(@nbr int) 
	returns int
as
begin
	return @nbr + 1
end
go
declare @x int
set @x = dbo.inc(5)
select @x
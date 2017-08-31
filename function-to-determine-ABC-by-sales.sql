alter function abc(@sales bigint)
	returns varchar(1)
as
begin
	declare @abccode varchar(1)
	if @sales > 1000000000
		set @abccode = 'A'
	else
		if @sales > 1000000
			set @abccode = 'B'
		else
			set @abccode = 'C'
	return @abccode
end
go
select dbo.abc(5000000000)
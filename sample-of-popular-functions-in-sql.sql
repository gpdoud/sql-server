declare @aString varchar(50)
set @aString = '                 ABC                 '
select ltrim(rtrim(@aString))

declare @aDate datetime
set @aDate = '2017-08-31'
select DateAdd(day, 7, @aDate)

declare @anInt int
set @anInt = 1

print 'The value of anInt is ' + CAST(@anInt as varchar(10) )

select count(*) from sales
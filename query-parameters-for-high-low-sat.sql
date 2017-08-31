declare @lowsatscore int
declare @highsatscore int
set @lowsatscore = 800
set @highsatscore = 1200

select firstname, lastname, sat, gpa, majorid from student
where sat > @lowsatscore and sat < @highsatscore

declare @majorid int
set @majorid = 3

if exists (select * from student where majorid = @majorid)
	print 'Students are taking this major'
else
	print 'No students in major'

select 'Hello!'
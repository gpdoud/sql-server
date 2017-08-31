alter procedure ListStudents
as
begin
	SELECT concat(firstname, ' ', lastname) as 'Full Name', GPA, SAT, 
			isnull(description, 'UNDECLARED') as 'Major' 
		from Student
		left join Major
			on Student.MaJorid = major.id
		order by gpa desc
end
go
exec ListStudents
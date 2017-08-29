SELECT major.description as 'Major', 
	concat(student.firstname, ' ', student.lastname) as 'Full Name'
	from major
	join student
		on student.majorid = major.id
	order by major.description
go
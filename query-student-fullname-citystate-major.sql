create table State (
	Code nvarchar(2) not null primary key,
	Name nvarchar(30) not null
)

insert into State (code, name) values ('OH', 'Ohio')
insert into State (code, name) values ('KY', 'Kentucky')
insert into State (code, name) values ('IN', 'Indiana')

alter table Student
	add foreign key (State) references State(Code)

SELECT concat(s.FirstName, ' ', s.LastName) as 'Full Name', 
	concat(s.City, ', ', st.Name) as 'City/State', m.Description as 'Major'
	From Student s
	Join Major m
		on s.MajorId = m.Id
	Join State st
		on s.State = st.Code
	Order by st.Name

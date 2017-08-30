create table Sales (
	Id int not null primary key identity(1,1),
	Name nvarchar(50) not null,
	SalesYTD money not null default 0,
	ABC nvarchar(1) not null
)
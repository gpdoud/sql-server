create table Major (
	Id int not null primary key identity(1,1),
	Description nvarchar(50) not null
)

insert into major (Description) values ('Audiology')
insert into major (Description) values ('Biology')
insert into major (Description) values ('Linguistics')
insert into major (Description) values ('CS')
insert into major (Description) values ('ME')
insert into major (Description) values ('IPS')

select * from major
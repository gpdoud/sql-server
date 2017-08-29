/*
create table vendor (
	Id int not null primary key identity(1,1),
	Name nvarchar(50) not null
)
*/

-- insert into vendor (Name) values ('Amazon')

select * from vendor

delete from vendor where id = 1
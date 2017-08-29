create table Friend (
	id int not null primary key identity(1,1),
	name nvarchar(30) not null,
	age int not null,
	friendsFor int not null,
	email nvarchar(255),
	phone nvarchar(10)
)

insert into friend (name, age, friendsFor, email, phone)
values ('Ray',62,30,'ray@cincyfriends.com','5135551212')
insert into friend (name, age, friendsFor, email, phone)
values ('Randy',59,25,'randy@cincyfriends.com','5135551212')
insert into friend (name, age, friendsFor, email, phone)
values ('Bill',56,8,'bill@cincyfriends.com','5135551212')
insert into friend (name, age, friendsFor, email, phone)
values ('Kevin',53,8,'kevin@cincyfriends.com','5135551212')
insert into friend (name, age, friendsFor, email, phone)
values ('Steve',55,5,'steve@cincyfriends.com','5135551212')

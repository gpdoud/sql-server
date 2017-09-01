use master
go
drop database if exists prsdbx
go
create database prsdbx
go
use prsdbx
go
create table [User] (
	Id int not null primary key identity(1,1),
	UserName varchar(20) not null,
	Password varchar(10) not null,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	Phone varchar(12) not null,
	Email varchar(75) not null,
	IsReviewer bit not null default 0,
	IsAdmin bit not null default 0,
	Active bit not null default 1,
	DateCreated datetime not null default getdate(),
	DateUpdated datetime,
	UpdatedByUser int foreign key references [User](id)
)
go
-- to support unique UserNames
create unique index IUX_UserName
	on [User](UserName)
go
--
INSERT into [User]
	(UserName, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin) VALUES
	('gpdoud', 'password', 'Greg', 'Doud', '513-703-7315', 'gdoud@maxtrain.com', 1, 1)
INSERT into [User]
	(UserName, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin) VALUES
	('user', 'user', 'Guest', 'User', '513-555-1212', 'newuser@yahoo.com', 0, 0)
go
CREATE TABLE Vendor (
)
use master
go
drop database if exists prsdbx
go
create database prsdbx
go
use prsdbx
go
set nocount on
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
	Id int not null primary key identity(1,1),
	Code varchar(10) not null,
	Name varchar(255) not null,
	Address varchar(255) not null default '',
	City varchar(255) not null default '',
	State varchar(2) not null default '',
	Zip varchar(5) not null default '',
	Phone varchar(12) not null default '',
	Email varchar(100) not null default '',
	IsPreApproved bit not null default 0,
	Active bit not null default 1,
	DateCreated datetime not null default getdate(),
	DateUpdated datetime,
	UpdatedByUser int foreign key references [User](id)
)
go
-- to support unique Codes
create unique index IUX_Code
	on [Vendor](Code)
go
--
INSERT into Vendor(Code,Name)
	VALUES('AMZ','Amazon')
INSERT into Vendor(Code,Name)
	VALUES('BB','BestBuy')
INSERT into Vendor(Code,Name)
	VALUES('TGT','Target')
INSERT into Vendor(Code,Name)
	VALUES('WM','Walmart')
INSERT into Vendor(Code,Name)
	VALUES('BN','Barnes & Noble')
INSERT into Vendor(Code,Name)
	VALUES('APL','Apple')
go
CREATE TABLE Product (
	Id int not null primary key identity(1,1),
	VendorId int not null foreign key references [Vendor](Id),
	PartNumber varchar(50) not null default '',
	Name varchar(150) not null default '',
	Price decimal(10,2) not null default 0,
	Unit varchar(255) not null default 'Each',
	PhotoPath varchar(255),
	Active bit not null default 1,
	DateCreated datetime not null default getdate(),
	DateUpdated datetime,
	UpdatedByUser int foreign key references [User](id)
)
go
declare @vendorId int
SELECT @vendorId = id from Vendor where Code = 'AMZ'
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'Echo', 'Echo', 99.99)
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'Dot', 'Dot', 49.99)
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'Echo Show', 'Echo Show', 229.99)
go
declare @vendorId int
SELECT @vendorId = id from Vendor where Code = 'BB'
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'Yoga', 'Lenovo Yoga', 729.99)
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'Inspiron', 'Dell Inspiron', 349.99)
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'Macbook', 'Macbook Air', 949.99)
go
declare @vendorId int
SELECT @vendorId = id from Vendor where Code = 'TGT'
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'D3400', 'Nikon D3400', 999.99)
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'EOS', 'Canon EOS', 449.99)
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'D750', 'Nikon D750', 3599.99)
go
declare @vendorId int
SELECT @vendorId = id from Vendor where Code = 'WM'
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'SUHD', 'Samsung UHD', 7499.99)
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'VIZIO', 'Vizio Class', 1698.99)
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'AQUOS', 'Sharp AQUOS', 9997.99)
go
declare @vendorId int
SELECT @vendorId = id from Vendor where Code = 'BN'
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'VCS', 'Visual C#', 154.99)
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'CSNUT', 'C# 7 in a Nutshell', 71.99)
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'HFCS', 'Head First C#', 35.99)
go
declare @vendorId int
SELECT @vendorId = id from Vendor where Code = 'APL'
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'IP7', 'iPhone 7', 649.99)
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'IP7P', 'iPhone 7 Plus', 769.99)
INSERT into Product
	(VendorId, PartNumber, Name, Price) values 
	(@vendorId, 'IW', 'iWatch', 269.99)
go
CREATE TABLE Status (
	Id int not null primary key identity(1,1),
	Description varchar(20) not null,
	Active bit not null default 1,
	DateCreated datetime not null default getdate(),
	DateUpdated datetime,
	UpdatedByUser int foreign key references [User](id)
)
go
INSERT into Status (Description) VALUES ('New')
INSERT into Status (Description) VALUES ('Review')
INSERT into Status (Description) VALUES ('Approved')
INSERT into Status (Description) VALUES ('Rejected')
INSERT into Status (Description) VALUES ('Revise')
go
CREATE TABLE PurchaseRequest (
	Id int not null primary key identity(1,1),
	UserId int foreign key references [User](id),
	Description varchar(20) not null default '',
	Justification varchar(255) default '',
	DateNeeded datetime default DateAdd(day, 7, getDate()),
	DeliveryMode varchar(25) default 'UPS',
	StatusId int not null default 1,
	Total decimal(10,2) not null default 0,
	SubmittedDate datetime not null default getdate(),
	ReasonForRejection varchar(100) default '',
	Active bit not null default 1,
	DateCreated datetime not null default getdate(),
	DateUpdated datetime,
	UpdatedByUser int foreign key references [User](id)
)
go
declare @userId int
SELECT @userId = Id from [User] where UserName = 'gpdoud'
INSERT into PurchaseRequest
	(UserId, Description) VALUES (@userId, 'Init-PR')
go
CREATE TABLE PurchaseRequestLineItem (
	Id int not null primary key identity(1,1),
	PurchaseRequestId int not null foreign key references PurchaseRequest(Id),
	ProductId int not null foreign key references Product(Id),
	Quantity int not null default 1
)
go
declare @prId int
SELECT @prId = Id from PurchaseRequest where Description = 'Init-PR'
declare @pId int
SELECT @pId = Id from Product where PartNumber = 'Echo'
INSERT into PurchaseRequestLineItem
	(PurchaseRequestId, ProductId, Quantity) Values (@prId,@pId,1)
SELECT @pId = Id from Product where PartNumber = 'Macbook'
INSERT into PurchaseRequestLineItem
	(PurchaseRequestId, ProductId, Quantity) Values (@prId,@pId,1)
SELECT @pId = Id from Product where PartNumber = 'D750'
INSERT into PurchaseRequestLineItem
	(PurchaseRequestId, ProductId, Quantity) Values (@prId,@pId,1)
SELECT @pId = Id from Product where PartNumber = 'AQUOS'
INSERT into PurchaseRequestLineItem
	(PurchaseRequestId, ProductId, Quantity) Values (@prId,@pId,1)
SELECT @pId = Id from Product where PartNumber = 'VCS'
INSERT into PurchaseRequestLineItem
	(PurchaseRequestId, ProductId, Quantity) Values (@prId,@pId,1)
SELECT @pId = Id from Product where PartNumber = 'IP7'
INSERT into PurchaseRequestLineItem
	(PurchaseRequestId, ProductId, Quantity) Values (@prId,@pId,1)
go
create table PurchaseOrder (
	Id int not null primary key identity(1,1),
	PurchasedDate datetime not null,
	VendorId int not null foreign key references Vendor(Id)
)

INSERT PurchaseOrder (PurchasedDate, VendorId) VALUES ('2017-08-29', 1)

select * from PurchaseOrder
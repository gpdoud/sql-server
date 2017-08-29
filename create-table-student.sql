CREATE Table Student (
	Id int not null primary key identity(1,1),
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(30) NOT NULL,
	Address NVARCHAR(50) NOT NULL,
	City NVARCHAR(40) NOT NULL,
	State nvarchar(2) NOT NULL,
	Zipcode nvarchar(10) NOT NULL,
	PhoneNumber nvarchar(10),
	Email nvarchar(255),
	Birthday datetime NOT NULL
)
-- Education DB
USE Master
GO
DROP DATABASE IF EXISTS Ed1DB;
Go
CREATE DATABASE Ed1DB;
Go
USE ED1DB;
Go
-- drop all tables
DROP TABLE IF EXISTS MajorClassRelationship;
DROP TABLE IF EXISTS StudentClassRelationship;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Major;
DROP TABLE IF EXISTS Assignment;
DROP TABLE IF EXISTS Class;
DROP TABLE IF EXISTS Instructor;
DROP TABLE IF EXISTS ClassGrade;

-- create the tables
CREATE TABLE ClassGrade (
	Id INT PRIMARY KEY IDENTITY(1,1),
	Grade VARCHAR(3) NOT NULL,
	GpaValue DECIMAL(4,2) NOT NULL DEFAULT 0.0
);

CREATE TABLE Major (
	Id INT PRIMARY KEY IDENTITY(1,1),
	Description VARCHAR(50) NOT NULL,
	ReqSat INT NOT NULL
);
CREATE TABLE Student (
	Id INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	SAT INT,
	GPA DECIMAL(4,2) NOT NULL,
	MajorId INT,
	FOREIGN KEY (MajorId) REFERENCES Major(Id)
);

CREATE TABLE Instructor (
	Id INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	YearsExperience INT NOT NULL DEFAULT 0,
	IsTenured BIT NOT NULL DEFAULT 0
);

CREATE TABLE Class (
	Id INT PRIMARY KEY IDENTITY(1,1),
	Subject VARCHAR(30) NOT NULL,
	Section INT NOT NULL,
	InstructorId INT,
	FOREIGN KEY (InstructorId) REFERENCES Instructor(Id)
);

CREATE TABLE Assignment (
	Id INT PRIMARY KEY IDENTITY(1,1),
	Description VARCHAR(30) NOT NULL,
	ClassId INT NOT NULL,
	FOREIGN KEY (ClassId) REFERENCES Class(Id)
);

CREATE TABLE MajorClassRelationship (
	Id INT PRIMARY KEY IDENTITY(1,1),
	MajorId INT NOT NULL,
	ClassId INT NOT NULL,
	FOREIGN KEY (MajorId) REFERENCES Major(Id),
	FOREIGN KEY (ClassId) REFERENCES Class(Id)
);

CREATE TABLE Student_Class_Relationship (
	Id INT PRIMARY KEY IDENTITY(1,1),
	Student_Id INT NOT NULL,
	ClassId INT NOT NULL,
	ClassGradeId INT,
	FOREIGN KEY (Student_Id) REFERENCES Student(Id),
	FOREIGN KEY (ClassId) REFERENCES Class(Id),
	FOREIGN KEY (ClassGradeId) REFERENCES Classgrade(Id)
);

-- CLASSGRADE: Data
INSERT ClassGrade (Grade, GpaValue) VALUES ('A+',4.35);
INSERT ClassGrade (Grade, GpaValue) VALUES ('A',4.0);
INSERT ClassGrade (Grade, GpaValue) VALUES ('A-',3.7);
INSERT ClassGrade (Grade, GpaValue) VALUES ('B+',3.35);
INSERT ClassGrade (Grade, GpaValue) VALUES ('B',3.0);
INSERT ClassGrade (Grade, GpaValue) VALUES ('B-',2.7);
INSERT ClassGrade (Grade, GpaValue) VALUES ('C+',2.35);
INSERT ClassGrade (Grade, GpaValue) VALUES ('C',2.0);
INSERT ClassGrade (Grade, GpaValue) VALUES ('C-',1.7);
INSERT ClassGrade (Grade, GpaValue) VALUES ('D+',1.35);
INSERT ClassGrade (Grade, GpaValue) VALUES ('D',1.0);
INSERT ClassGrade (Grade, GpaValue) VALUES ('D-',0.5);
INSERT ClassGrade (Grade, GpaValue) VALUES ('F',0.0);

-- MAJOR: Sample data
SET IDENTITY_INSERT Major ON
INSERT Major (Id, Description, ReqSat) VALUES (1,'General Business',800);
INSERT Major (Id, Description, ReqSat) VALUES (2,'Accounting', 1000);
INSERT Major (Id, Description, ReqSat) VALUES (3,'Finance', 1100);
INSERT Major (Id, Description, ReqSat) VALUES (4,'Math', 1300);
INSERT Major (Id, Description, ReqSat) VALUES (5,'Engineering', 1350);
INSERT Major (Id, Description, ReqSat) VALUES (6,'Education', 900);
INSERT Major (Id, Description, ReqSat) VALUES (7,'General Studies', 500);
SET IDENTITY_INSERT Major OFF
-- STUDENT: Sample data
SET IDENTITY_INSERT Student ON
INSERT Student (Id,FirstName,LastName,SAT,GPA,MajorId) VALUES(100,'Eric','Ephram',1200,3.0,1);
INSERT Student (Id,FirstName,LastName,SAT,GPA,MajorId) VALUES(110,'Greg','Gould',1100,2.5,null);
INSERT Student (Id,FirstName,LastName,SAT,GPA,MajorId) VALUES(120,'Adam','Ant',1300,3.2,null);
INSERT Student (Id,FirstName,LastName,SAT,GPA,MajorId) VALUES(130,'Howard','Hess',1600,3.7,null);
INSERT Student (Id,FirstName,LastName,SAT,GPA,MajorId) VALUES(140,'Charles','Caldwell',900,2.1,null);
INSERT Student (Id,FirstName,LastName,SAT,GPA,MajorId) VALUES(150,'James','Joyce',1100,2.5,null);
INSERT Student (Id,FirstName,LastName,SAT,GPA,MajorId) VALUES(160,'Doug','Dumas',1350,3.1,null);
INSERT Student (Id,FirstName,LastName,SAT,GPA,MajorId) VALUES(170,'Kevin','Kraft',1000,2.7,null);
INSERT Student (Id,FirstName,LastName,SAT,GPA,MajorId) VALUES(180,'Frank','Fountain',1000,2.5,null);
INSERT Student (Id,FirstName,LastName,SAT,GPA,MajorId) VALUES(190,'Brian','Biggs',950,2.3,null);
SET IDENTITY_INSERT Student OFF
-- INSTRUCTOR: Sample data
SET IDENTITY_INSERT Instructor ON
INSERT Instructor (Id,FirstName,LastName,YearsExperience,IsTenured) VALUES (10,'Joe','Downey',10,1);
INSERT Instructor (Id,FirstName,LastName,YearsExperience,IsTenured) VALUES (20,'Jane','Jones',6,1);
INSERT Instructor (Id,FirstName,LastName,YearsExperience,IsTenured) VALUES (30,'Bill','Tensi',3,0);
INSERT Instructor (Id,FirstName,LastName,YearsExperience,IsTenured) VALUES (40,'Sherry','Nagy',14,1);
INSERT Instructor (Id,FirstName,LastName,YearsExperience,IsTenured) VALUES (50,'Frank','Schell',23,1);
INSERT Instructor (Id,FirstName,LastName,YearsExperience,IsTenured) VALUES (60,'Michelle','Bellman',35,1);
INSERT Instructor (Id,FirstName,LastName,YearsExperience,IsTenured) VALUES (70,'George','Hunt',2,0);
INSERT Instructor (Id,FirstName,LastName,YearsExperience,IsTenured) VALUES (80,'Amy','Brock',7,0);
INSERT Instructor (Id,FirstName,LastName,YearsExperience,IsTenured) VALUES (90,'Larry','Seger',11,1);
INSERT Instructor (Id,FirstName,LastName,YearsExperience,IsTenured) VALUES (100,'Kathy','Miller',21,1);
SET IDENTITY_INSERT Instructor OFF
-- CLASS: Sample data
-- English
SET IDENTITY_INSERT Class ON
INSERT Class (Id,Subject,Section,InstructorId) VALUES(10101,'English',101,10);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(10102,'English',102,NULL);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(10103,'English',103,NULL);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(10201,'English',201,10);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(10202,'English',202,NULL);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(10203,'English',203,NULL);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(10301,'English',301,10);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(10302,'English',302,NULL);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(10303,'English',303,NULL);
-- Math
INSERT Class (Id,Subject,Section,InstructorId) VALUES(20201,'Math',201,50);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(20202,'Math',202,NULL);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(20203,'Math',203,NULL);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(20204,'Math',204,NULL);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(20401,'Math',401,50);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(20402,'Math',402,NULL);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(20403,'Math',403,NULL);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(20404,'Math',404,NULL);
-- History
INSERT Class (Id,Subject,Section,InstructorId) VALUES(30101,'History',101,80);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(30202,'History',201,80);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(30303,'History',301,80);
-- Computer Science
INSERT Class (Id,Subject,Section,InstructorId) VALUES(40311,'Computer Science',311,40);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(40312,'Computer Science',312,40);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(40313,'Computer Science',313,40);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(40441,'Computer Science',441,40);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(40442,'Computer Science',442,40);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(40443,'Computer Science',443,40);
-- Psychology
INSERT Class (Id,Subject,Section,InstructorId) VALUES(50101,'Psychology',101,20);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(50102,'Psychology',102,20);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(50231,'Psychology',231,20);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(50232,'Psychology',232,20);
-- Education
INSERT Class (Id,Subject,Section,InstructorId) VALUES(60221,'Education',221,60);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(60222,'Education',222,60);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(60223,'Education',223,60);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(60351,'Education',351,70);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(60352,'Education',352,70);
INSERT Class (Id,Subject,Section,InstructorId) VALUES(60353,'Education',353,70);
SET IDENTITY_INSERT Class OFF
-- Classes needed for Major: General Business
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(1,10101); -- Gen bus | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(1,10102); -- Gen bus | Eng 102
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(1,10103); -- Gen bus | Eng 103
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(1,20201); -- Gen bus | Mat 201
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(1,20202); -- Gen bus | Mat 202
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(1,20203); -- Gen bus | Mat 203
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(1,30101); -- Gen bus | His 101

-- Classes needed for Major: Accounting
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(2,10101); -- Acct | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(2,10102); -- Acct | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(2,10103); -- Acct | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(2,20201); -- Acct | Mat 201
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(2,20202); -- Acct | Mat 202
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(2,20203); -- Acct | Mat 203
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(2,30101); -- Acct | His 101
-- Classes needed for Major: Finance
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(3,10101); -- Fin | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(3,10102); -- Fin | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(3,10103); -- Fin | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(3,20201); -- Fin | Mat 201
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(3,20202); -- Fin | Mat 202
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(3,20203); -- Fin | Mat 203
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(3,30101); -- Fin | His 101
-- Classes needed for Major: Finance
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(4,10101); -- Math | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(4,10102); -- Math | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(4,10103); -- Math | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(4,20201); -- Math | Mat 201
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(4,20202); -- Math | Mat 202
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(4,20203); -- Math | Mat 203
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(4,20204); -- Math | Mat 204
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(4,20401); -- Math | Mat 201
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(4,20402); -- Math | Mat 202
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(4,20403); -- Math | Mat 203
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(4,20404); -- Math | Mat 204
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(4,30101); -- Math | His 101
-- Classes needed for Major: Finance
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(5,10101); -- Eng | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(5,10102); -- Eng | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(5,10103); -- Eng | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(5,20201); -- Eng | Mat 201
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(5,20202); -- Eng | Mat 202
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(5,20203); -- Eng | Mat 203
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(5,30101); -- Eng | His 101

-- Classes needed for Major: Finance
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(6,10101); -- Educ | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(6,10102); -- Educ | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(6,10103); -- Educ | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(6,20201); -- Educ | Mat 201
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(6,20202); -- Educ | Mat 202
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(6,20203); -- Educ | Mat 203
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(6,30101); -- Educ | His 101

-- Classes needed for Major: Finance
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(7,10101); -- GS | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(7,10102); -- GS | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(7,10103); -- GS | Eng 101
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(7,20201); -- GS | Mat 201
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(7,20202); -- GS | Mat 202
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(7,20203); -- GS | Mat 203
INSERT MajorClassRelationship (MajorId, ClassId) VALUES(7,30101); -- GS | His 101

-- Classes taken by a Student
INSERT Student_Class_Relationship (Student_Id,ClassId,ClassGradeId) VALUES (100,10101,1);

select m.Description as 'Major', m.ReqSat as 'SAT', c.Subject as 'Subject', c.Section as 'Section'
	from Major m 
	join MajorClassrelationship mc  
		on mc.MajorId = m.Id 
	join Class c
		on c.Id = mc.ClassId
	where m.Description in ('General Business','Math');

-- Classes remaining for a Student of a Major
select concat(s.FirstName,' ',s.LastName) as 'Name', concat(c.subject, ' ',c.section) as 'Class'
	from Student s
	join Major m
		on s.MajorId = m.Id
	join MajorClassrelationship mc
		on m.Id = mc.MajorId
	join Class c
		on c.Id = mc.ClassId
where c.Id not in (
			select c.Id
				from Student s
				join Student_Class_Relationship sc
					on s.Id = sc.Student_Id
				join Class c
					on c.Id = sc.ClassId
		);

select concat(s.FirstName,' ',s.LastName) as 'Name', c.Subject as 'Class'
	, i.LastName as 'Instructor', cg.Grade as 'Grade', cg.GpaValue as 'GPA Value'
	from Student s
	join Student_Class_Relationship sc
		on s.Id = sc.Student_Id
	join Class c 
		on c.Id = sc.ClassId
	join ClassGrade cg 
		on sc.ClassGradeId = cg.Id
	join Instructor i
		on i.Id = c.InstructorId
where s.Id = 100;

select concat(s.FirstName,' ',s.LastName) as 'Name', concat(c.subject,' ',c.section) as 'Class'
		,  i.LastName as 'Instructor'
	from Student s 
	join Student_Class_Relationship sc 
		on s.Id = sc.Student_Id
	join Class c 
		on c.Id = sc.ClassId
	left join Instructor i 
		on i.Id = c.InstructorId;
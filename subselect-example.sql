/****** Script for SelectTopNRows command from SSMS  ******/
SELECT FirstName, LastName, Sat, gpa from [Student]

select FirstName, LastName, Sat, gpa from [Student] where SAT > 1200

select avg(gpa) from student
select FirstName, LastName, Sat, gpa from [Student] where GPA > 3.32

select FirstName, LastName, Sat, gpa from [Student] 
	where GPA > (select avg(gpa) from student where gpa > 3.5)


select FirstName, LastName, Sat, gpa from [Student] 
	where sat = (select max(sat) from student)

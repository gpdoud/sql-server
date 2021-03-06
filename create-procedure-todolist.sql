alter procedure ListTodo
as
begin
	select todo.description, concat(abc, priority) as 'ABCPriority', format(duedate, 'MM/dd/yyyy') as 'Due', 
		category.description as 'Category' 
		from todo
		join category
			on category.code = todo.categoryCode
		where todo.complete = 0
		order by ABCPriority
end
go
exec listtodo
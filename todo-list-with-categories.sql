select t.description as 'Todo', concat(t.abc, t.priority) as 'ABCPri', 
	t.duedate as 'Due', c.description as 'Category', t.complete as 'Done'
	from todo t
	join category c
		on c.code = t.categorycode
	where t.complete = 0
	order by t.abc, t.priority

select t.description as 'Todo', concat(t.abc, t.priority) as 'ABCPri', 
	t.duedate as 'Due', c.description as 'Category', t.complete as 'Done'
	from todo t
	join category c
		on c.code = t.categorycode
	where t.complete = 0
	order by t.duedate, t.abc, t.priority
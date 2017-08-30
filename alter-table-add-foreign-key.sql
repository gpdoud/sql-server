alter table todo
	add foreign key (categorycode) references Category(code)

alter table todo
	alter column categorycode int not null
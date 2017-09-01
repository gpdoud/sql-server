alter procedure ValidateLogin
	@UserName varchar(20),
	@Password varchar(10)
as
begin
	if exists (select * from [User] 
		where UserName = @UserName and Password = @Password)
	begin -- if true, do these statements
		print 'The user is valid!'
	end
	else
	begin -- if false, do these statements
		print 'The username/password combination is invalid'
	end
end
go
exec ValidateLogin @UserName = 'gpdoud', @Password = 'password'
go

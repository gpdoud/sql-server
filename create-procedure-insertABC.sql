/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4422)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [DotNetDatabase]
GO
/****** Object:  StoredProcedure [dbo].[InsertABC]    Script Date: 8/31/2017 2:24:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[InsertABC]
	@abcvalue nvarchar(1)
as
begin
	if @abcvalue = 'A' or @abcvalue = 'B' or @abcvalue = 'C' or @abcvalue = 'X'
	begin
		insert into SalesAnalysis (ABC) values (@abcvalue)
	end
	else
	begin
		select 'Input is invalid; skipping SQL Insert' as 'Error', @abcvalue as 'User Input'
	end
end

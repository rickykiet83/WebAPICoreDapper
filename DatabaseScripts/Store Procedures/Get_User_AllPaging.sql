USE [RestAPIDapper]
GO
/****** Object:  StoredProcedure [dbo].[Get_Role_AllPaging]    Script Date: 12/28/2018 8:15:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Get_User_AllPaging]
	@keyword nvarchar(50),
	@pageIndex int,
	@pageSize int,
	@totalRow int output
as
begin
	set nocount on;
	select @totalRow = count(*) from AspNetUsers r
	where (@keyword is null or r.FullName like @keyword +'%' or r.UserName like @keyword +'%')

	select Id,UserName,Email,PhoneNumber,FullName,Address from AspNetUsers r
	where (@keyword is null or r.FullName like @keyword +'%' or r.UserName like @keyword +'%')
	order by r.FullName
	offset (@pageIndex - 1) * @pageSize rows
	fetch next @pageSize row only
end
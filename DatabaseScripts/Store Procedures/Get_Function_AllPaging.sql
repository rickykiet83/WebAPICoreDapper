USE [RestAPIDapper]
GO
/****** Object:  StoredProcedure [dbo].[Get_Role_AllPaging]    Script Date: 12/28/2018 8:28:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Get_Function_AllPaging]
	@keyword nvarchar(50),
	@pageIndex int,
	@pageSize int,
	@totalRow int output
as
begin
	set nocount on;
	select @totalRow = count(*) from Functions r
	where (@keyword is null or r.Name like @keyword +'%')

	SELECT [Id]
      ,[Name]
      ,[Url]
      ,[ParentId]
      ,[SortOrder]
      ,[CssClass]
      ,[IsActive]
  FROM [dbo].[Functions] f
	where (@keyword is null or f.Name like @keyword +'%')
	order by f.Name
	offset (@pageIndex - 1) * @pageSize rows
	fetch next @pageSize row only
end
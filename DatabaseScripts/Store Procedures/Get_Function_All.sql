USE [RestAPIDapper]
GO
/****** Object:  StoredProcedure [dbo].[Get_Role_All]    Script Date: 12/28/2018 8:26:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Get_Function_All]
as
begin
	set nocount on;

	SELECT [Id]
      ,[Name]
      ,[Url]
      ,[ParentId]
      ,[SortOrder]
      ,[CssClass]
      ,[IsActive]
  FROM [dbo].[Functions]
end
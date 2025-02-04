USE [RestAPIDapper]
GO
/****** Object:  StoredProcedure [dbo].[Get_Role_All]    Script Date: 12/28/2018 8:26:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Get_Function_ById]
@id varchar(50)
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
  FROM [dbo].[Functions] where Id = @id
end
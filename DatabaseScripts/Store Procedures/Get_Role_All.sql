USE [RestAPIDapper]
GO
/****** Object:  StoredProcedure [dbo].[Get_Role_All]    Script Date: 12/28/2018 8:09:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Get_Role_All]
as
begin
	set nocount on;

	select Id,Name from AspNetRoles
end
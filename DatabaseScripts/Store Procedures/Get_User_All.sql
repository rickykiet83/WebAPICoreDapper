USE [RestAPIDapper]
GO
/****** Object:  StoredProcedure [dbo].[Get_Role_All]    Script Date: 12/28/2018 8:14:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Get_User_All]
as
begin
	set nocount on;

	select Id,UserName,Email,PhoneNumber,FullName,Address from AspNetUsers
end
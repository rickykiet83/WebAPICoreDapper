USE [RestAPIDapper]
GO
/****** Object:  StoredProcedure [dbo].[Get_Permission_ByRoleId]    Script Date: 1/12/2019 12:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ToanBN - TEDU.COM.VN
-- Create date: 11/1/2019
-- Description:	Get permission by role id
-- =============================================
CREATE PROCEDURE [dbo].[Get_Permission_ByRoleId]
	@roleId uniqueidentifier null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select 
		p.FunctionId,
		p.ActionId,
		p.RoleId
	from Permissions p inner join Actions a
		on p.ActionId = a.Id 
	where p.RoleId = @roleId
END

USE [RestAPIDapper]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		TEDU
-- Create date: 28/12/2018
-- Description:	Delete function
-- =============================================
create PROCEDURE [dbo].[Delete_Function_ById]
	@id int
AS
BEGIN
	SET NOCOUNT ON;
	delete from Functions where Id = @id
END

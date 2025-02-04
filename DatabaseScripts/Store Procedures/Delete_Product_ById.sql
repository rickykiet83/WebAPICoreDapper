USE [RestAPIDapper]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Product_ById]    Script Date: 12/19/2018 10:11:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		TEDU
-- Create date: 18/12/2018
-- Description:	update product
-- =============================================
CREATE PROCEDURE [dbo].[Delete_Product_ById]
	@id int
AS
BEGIN
	SET NOCOUNT ON;
	set xact_abort on;
	Begin tran
			begin try
			delete from Products where Id = @id
			delete from ProductTranslations where ProductId = @id
		commit
	end try
		begin catch
			rollback
			DECLARE @ErrorMessage VARCHAR(2000)
			SELECT @ErrorMessage = 'Lỗi: ' + ERROR_MESSAGE()
			RAISERROR(@ErrorMessage, 16, 1)
		end catch
END

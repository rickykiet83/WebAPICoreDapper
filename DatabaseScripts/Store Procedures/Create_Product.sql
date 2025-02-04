USE [RestAPIDapper]
GO
/****** Object:  StoredProcedure [dbo].[Create_Product]    Script Date: 12/19/2018 10:37:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		TEDU
-- Create date: 18/12/2018
-- Description:	Select one recorrd by id 
-- =============================================
CREATE PROCEDURE [dbo].[Create_Product]
	@name nvarchar(255),
	@description nvarchar(255),
	@content ntext,
	@seoDescription nvarchar(255),
	@seoAlias nvarchar(255),
	@seoTitle nvarchar(255),
	@seoKeyword nvarchar(255),
	@sku varchar(50),
	@price float,
	@isActive bit,
	@imageUrl nvarchar(255),
	@language varchar(5),
	@categoryIds varchar(50),
	@id int output
AS
BEGIN
	SET NOCOUNT ON;
	set xact_abort on;
	begin tran
	begin try
	   insert into Products(Sku,Price,IsActive,ImageUrl,CreatedAt,ViewCount,RateTotal,RateCount)
	   values(@sku,@price,@isActive,@imageUrl,getdate(),0,0,0)
		set @id = SCOPE_IDENTITY()

	   insert into ProductTranslations(ProductId,LanguageId,Content,Name,Description,SeoDescription,SeoAlias,SeoTitle,SeoKeyword)
	   values(@id,@language,@content,@name,@description,@seoDescription,@seoAlias,@seoTitle,@seoKeyword)

	   delete from ProductInCategories where ProductId = @id

	   	   insert into ProductInCategories
	    select @id as ProductId,cast(String as int) as CategoryId from ufn_CSVToTable(@categoryIds,',')


	commit
	end try
	begin catch
		rollback
		  DECLARE @ErrorMessage VARCHAR(2000)
		  SELECT @ErrorMessage = 'Lỗi: ' + ERROR_MESSAGE()
		  RAISERROR(@ErrorMessage, 16, 1)
	end catch



  
END

USE [RestAPIDapper]
GO
/****** Object:  StoredProcedure [dbo].[Get_Product_ById]    Script Date: 12/19/2018 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		TEDU
-- Create date: 18/12/2018
-- Description:	Select one recorrd by id 
-- =============================================
CREATE PROCEDURE [dbo].[Get_Product_ById]
@id int,
@language varchar(5)
AS
BEGIN
	SET NOCOUNT ON;

    select 
		p.Id,
		p.Sku,
		p.Price,
		p.DiscountPrice,
		p.ImageUrl,
		p.CreatedAt,
		p.IsActive,
		p.ViewCount,
		pt.Name,
		pt.Content,
		pt.Description,
		pt.SeoAlias,
		pt.SeoDescription,
		pt.SeoKeyword,
		pt.SeoTitle,
		pt.LanguageId
	from Products p 
	inner join ProductTranslations pt on p.Id = pt.ProductId 
	where pt.LanguageId = @language and p.Id = @id
END

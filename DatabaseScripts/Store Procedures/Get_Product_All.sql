USE [RestAPIDapper]
GO
/****** Object:  StoredProcedure [dbo].[Get_Product_All]    Script Date: 12/19/2018 10:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Product_All]
	@language varchar(50)
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
	where pt.LanguageId = @language
END

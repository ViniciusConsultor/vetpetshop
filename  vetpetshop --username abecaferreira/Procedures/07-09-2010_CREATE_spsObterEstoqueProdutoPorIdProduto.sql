USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spsObterEstoqueProdutoPorIdProduto]    Script Date: 09/07/2010 19:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spsObterEstoqueProdutoPorIdProduto] 
	@IdProd INT
AS
BEGIN
	SELECT * FROM EstoqueProduto WHERE IdProduto = @IdProd
END

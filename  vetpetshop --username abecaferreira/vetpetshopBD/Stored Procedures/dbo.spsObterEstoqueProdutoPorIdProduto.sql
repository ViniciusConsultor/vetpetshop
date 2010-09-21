SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create PROCEDURE [dbo].[spsObterEstoqueProdutoPorIdProduto] 
	@IdProd INT
AS
BEGIN
	SELECT * FROM EstoqueProduto WHERE IdProduto = @IdProd
END
GO

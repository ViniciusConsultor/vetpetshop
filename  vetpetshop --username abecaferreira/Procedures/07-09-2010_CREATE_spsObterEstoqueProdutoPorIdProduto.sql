USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterEstoqueProdutoPorIdProduto]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterEstoqueProdutoPorIdProduto
GO

CREATE PROCEDURE [dbo].[spsObterEstoqueProdutoPorIdProduto] 
	@IdProd INT
AS

SET NOCOUNT ON

BEGIN
	SELECT * FROM EstoqueProduto WHERE IdProduto = @IdProd
END

SET NOCOUNT OFF

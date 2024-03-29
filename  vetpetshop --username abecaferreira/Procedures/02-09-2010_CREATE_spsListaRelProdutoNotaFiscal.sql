USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListaRelProdutoNotaFiscal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spsListaRelProdutoNotaFiscal]
GO

CREATE PROCEDURE [dbo].[spsListaRelProdutoNotaFiscal] 
	@IdNota INT
AS

SET NOCOUNT ON

BEGIN
	SELECT 
	a.Id,
	a.IdNotaFiscal,
	a.IdProduto,
	a.Quantidade,
	p.Nome,
	p.PrecoCusto
	FROM ProdutoNotaFiscal a INNER JOIN Produto p ON a.IdProduto = p.Id
	WHERE IdNotaFiscal = @IdNota
END

SET NOCOUNT OFF



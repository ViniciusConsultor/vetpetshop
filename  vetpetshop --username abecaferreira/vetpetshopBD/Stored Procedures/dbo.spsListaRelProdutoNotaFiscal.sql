SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spsListaRelProdutoNotaFiscal] 
	@IdNota INT
AS
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
GO

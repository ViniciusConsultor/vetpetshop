USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsFinancasValorAReceberPorAno]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsFinancasValorAReceberPorAno
GO

CREATE PROCEDURE [dbo].[spsFinancasValorAReceberPorAno]
	@Ano INT
AS

SET NOCOUNT ON

BEGIN
	SELECT MONTH(fp.DataTransacao) AS Mes, ABS(SUM((p.PrecoVenda - pn.Quantidade) - (p.PrecoVenda * fp.Quantidade))) AS TotalValorAReceber
	FROM FinanceiroProduto fp INNER JOIN Produto p ON p.Id = fp.IdProduto 
	INNER JOIN ProdutoNotaFiscal pn ON pn.IdProduto = fp.IdProduto
	WHERE YEAR(fp.DataTransacao) = @Ano
	GROUP BY MONTH(fp.DataTransacao)
END

SET NOCOUNT OFF
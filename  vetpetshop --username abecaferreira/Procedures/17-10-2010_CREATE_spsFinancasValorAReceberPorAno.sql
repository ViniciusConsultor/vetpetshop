if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsFinancasValorAReceberPorAno]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsFinancasValorAReceberPorAno
GO
/****** Object:  StoredProcedure [dbo].[spsFinancasValorAReceberPorAno]    Script Date: 10/17/2010 20:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsFinancasValorAReceberPorAno]
	@Ano INT
AS
BEGIN
	SELECT MONTH(fp.DataTransacao) AS Mes, ABS(SUM((p.PrecoVenda - pn.Quantidade) - (p.PrecoVenda * fp.Quantidade))) AS TotalValorAReceber
	FROM FinanceiroProduto fp INNER JOIN Produto p ON p.Id = fp.IdProduto 
	INNER JOIN ProdutoNotaFiscal pn ON pn.IdProduto = fp.IdProduto
	WHERE YEAR(fp.DataTransacao) = 2010
	GROUP BY MONTH(fp.DataTransacao)
END

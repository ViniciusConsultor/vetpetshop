if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsFinancasEstoquePorAno]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsFinancasEstoquePorAno
GO
/****** Object:  StoredProcedure [dbo].[spsFinancasEstoquePorAno]    Script Date: 10/16/2010 03:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsFinancasEstoquePorAno]
	@Ano INT
AS
BEGIN
	SELECT MONTH(n.DataCadastro), SUM(e.Quantidade * p.PrecoCusto) AS TotalEstoque 
	FROM EstoqueProduto ep inner join Estoque e ON ep.IdEstoque = e.Id
	inner join Produto p ON p.Id = ep.IdProduto 
	inner join ProdutoNotaFiscal pn ON pn.IdProduto = p.Id
	inner join NotaFiscal n ON n.Id = pn.IdNotaFiscal
	WHERE e.Quantidade >= pn.Quantidade AND YEAR(n.DataCadastro) = @Ano
	GROUP BY MONTH(n.DataCadastro)
END

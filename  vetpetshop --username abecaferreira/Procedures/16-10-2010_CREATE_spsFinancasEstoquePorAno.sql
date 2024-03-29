USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsFinancasEstoquePorAno]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsFinancasEstoquePorAno
GO

CREATE PROCEDURE [dbo].[spsFinancasEstoquePorAno]
	@Ano INT
AS

SET NOCOUNT ON

BEGIN
	SELECT MONTH(n.DataCadastro), SUM(e.Quantidade * p.PrecoCusto) AS TotalEstoque 
	FROM EstoqueProduto ep inner join Estoque e ON ep.IdEstoque = e.Id
	inner join Produto p ON p.Id = ep.IdProduto 
	inner join ProdutoNotaFiscal pn ON pn.IdProduto = p.Id
	inner join NotaFiscal n ON n.Id = pn.IdNotaFiscal
	WHERE e.Quantidade >= pn.Quantidade AND YEAR(n.DataCadastro) = @Ano
	GROUP BY MONTH(n.DataCadastro)
END

SET NOCOUNT OFF
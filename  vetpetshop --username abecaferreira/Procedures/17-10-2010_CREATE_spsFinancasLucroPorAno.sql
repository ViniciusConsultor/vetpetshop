USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsFinancasLucroPorAno]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsFinancasLucroPorAno
GO

CREATE PROCEDURE [dbo].[spsFinancasLucroPorAno]
	@Ano INT
AS

SET NOCOUNT ON

BEGIN
	SELECT MONTH(fp.DataTransacao) AS Mes, SUM((p.PrecoVenda - p.PrecoCusto) * fp.Quantidade) AS TotalLucro
	FROM FinanceiroProduto fp INNER JOIN Produto p ON p.Id = fp.IdProduto 
	WHERE YEAR(fp.DataTransacao) = @Ano
	GROUP BY MONTH(fp.DataTransacao)
END

SET NOCOUNT OFF
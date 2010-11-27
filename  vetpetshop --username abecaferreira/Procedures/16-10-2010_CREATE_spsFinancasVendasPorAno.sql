USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsFinancasVendasPorAno]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsFinancasVendasPorAno
GO

CREATE PROCEDURE [dbo].[spsFinancasVendasPorAno] 
	@Ano INT
AS

SET NOCOUNT ON

BEGIN
	SELECT MONTH(DataTransacao)AS MES, SUM(ValorTotal) FROM Financeiro
	WHERE TipoTransacao = 1 AND YEAR(DataTransacao) = @Ano
	GROUP BY MONTH(DataTransacao)
END

SET NOCOUNT OFF

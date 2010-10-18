if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsFinancasVendasPorAno]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsFinancasVendasPorAno
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsFinancasVendasPorAno] 
	@Ano INT
AS
BEGIN
	SELECT MONTH(DataTransacao)AS MES, SUM(ValorTotal) FROM Financeiro
	WHERE TipoTransacao = 1 AND YEAR(DataTransacao) = @Ano
	GROUP BY MONTH(DataTransacao)
END
GO

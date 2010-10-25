if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListarFinanceiroClientesEspeciaisPorAno]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListarFinanceiroClientesEspeciaisPorAno
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsListarFinanceiroClientesEspeciaisPorAno]
	@Ano INT
AS
BEGIN
	
	SELECT 
	f.NomeCliente, 
	f.DataTransacao AS Mes, 
	f.TipoTransacao, 
	cv.TipoConsulta, 
	f.ValorTotal AS ValorTotal 
	FROM Financeiro f
	LEFT JOIN ConsultaVeterinaria cv ON cv.IdFinanceiro = f.Id
	WHERE  f.NomeCliente IS NOT NULL AND YEAR(f.DataTransacao) = @Ano
	ORDER BY f.NomeCliente
	
END
GO

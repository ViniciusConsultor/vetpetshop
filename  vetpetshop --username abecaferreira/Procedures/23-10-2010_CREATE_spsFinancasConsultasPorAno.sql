USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsFinancasConsultasPorAno]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsFinancasConsultasPorAno
GO

CREATE PROCEDURE [dbo].[spsFinancasConsultasPorAno] 
	@Ano INT
AS

SET NOCOUNT ON

BEGIN

	SELECT MONTH(f.DataTransacao) AS MES, SUM(f.ValorTotal) AS ValorTotal FROM ConsultaVeterinaria cv
	INNER JOIN Financeiro F ON cv.IdFinanceiro = f.Id 
	WHERE cv.Status = 2 AND cv.TipoConsulta = 1 AND YEAR(f.DataTransacao) =@Ano and MONTH(f.DataTransacao) = MONTH(cv.Data)
	GROUP BY MONTH(f.DataTransacao)
		
END

SET NOCOUNT OFF
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsFinancasFaturamentoPorAno]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsFinancasFaturamentoPorAno
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsFinancasFaturamentoPorAno] 
	@Ano INT
AS
BEGIN

	SELECT MONTH(f.DataTransacao) AS MES, SUM(f.ValorTotal) AS ValorTotal FROM ConsultaVeterinaria cv
	INNER JOIN Financeiro f ON F.Id = cv.IdFinanceiro
	WHERE IdFinanceiro IS NOT NULL AND YEAR(DataTransacao) = @Ano AND MONTH(f.DataTransacao) = MONTH(cv.Data)
	GROUP BY MONTH(f.DataTransacao)
	
END
GO

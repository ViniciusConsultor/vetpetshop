if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsFinancasVacinasPorAno]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsFinancasVacinasPorAno
USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spsFinancasVacinasPorAno]    Script Date: 10/25/2010 01:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsFinancasVacinasPorAno] 
	@Ano INT
AS
BEGIN

	SELECT MONTH(f.DataTransacao) AS MES, SUM(f.ValorTotal) AS ValorTotal FROM ConsultaVeterinaria cv
	INNER JOIN Financeiro F ON cv.IdFinanceiro = f.Id 
	WHERE cv.Status = 2 AND cv.TipoConsulta = 2 AND YEAR(f.DataTransacao) = @Ano and MONTH(f.DataTransacao) = MONTH(cv.Data)
	GROUP BY MONTH(f.DataTransacao)
	
END

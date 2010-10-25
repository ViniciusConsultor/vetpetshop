if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsFinancasConsultasPorAno]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsFinancasConsultasPorAno
USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spsFinancasConsultasPorAno]    Script Date: 10/25/2010 01:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsFinancasConsultasPorAno] 
	@Ano INT
AS
BEGIN

	SELECT MONTH(f.DataTransacao) AS MES, SUM(f.ValorTotal) AS ValorTotal FROM ConsultaVeterinaria cv
	INNER JOIN Financeiro F ON cv.IdFinanceiro = f.Id 
	WHERE cv.Status = 2 AND cv.TipoConsulta = 1 AND YEAR(f.DataTransacao) =@Ano and MONTH(f.DataTransacao) = MONTH(cv.Data)
	GROUP BY MONTH(f.DataTransacao)
		
END
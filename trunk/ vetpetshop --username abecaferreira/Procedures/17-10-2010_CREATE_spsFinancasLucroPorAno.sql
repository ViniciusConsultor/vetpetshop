if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsFinancasLucroPorAno]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsFinancasLucroPorAno
GO
/****** Object:  StoredProcedure [dbo].[spsFinancasLucroPorAno]    Script Date: 10/17/2010 19:35:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsFinancasLucroPorAno]
	@Ano INT
AS
BEGIN
	SELECT MONTH(fp.DataTransacao) AS Mes, SUM((p.PrecoVenda - p.PrecoCusto) * fp.Quantidade) AS TotalLucro
	FROM FinanceiroProduto fp INNER JOIN Produto p ON p.Id = fp.IdProduto 
	WHERE YEAR(fp.DataTransacao) = 2010
	GROUP BY MONTH(fp.DataTransacao)
END

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsFinancasInvestimentoPorAno]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsFinancasInvestimentoPorAno
GO
/****** Object:  StoredProcedure [dbo].[spsFinancasInvestimentoPorAno]    Script Date: 10/15/2010 02:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsFinancasInvestimentoPorAno]
	@Ano INT
AS
BEGIN

	SELECT MONTH(DATACADASTRO)AS MES, SUM(VALOR) FROM NotaFiscal 
	WHERE Status = 2 AND YEAR(DATACADASTRO) = @Ano
	GROUP BY MONTH(DataCadastro)
		
END


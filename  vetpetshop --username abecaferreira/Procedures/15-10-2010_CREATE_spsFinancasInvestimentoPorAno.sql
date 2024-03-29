USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsFinancasInvestimentoPorAno]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsFinancasInvestimentoPorAno

GO

CREATE PROCEDURE [dbo].[spsFinancasInvestimentoPorAno]
	@Ano INT
AS

SET NOCOUNT ON

BEGIN

	SELECT MONTH(DATACADASTRO)AS MES, SUM(VALOR) FROM NotaFiscal 
	WHERE Status = 2 AND YEAR(DATACADASTRO) = @Ano
	GROUP BY MONTH(DataCadastro)
		
END

SET NOCOUNT OFF

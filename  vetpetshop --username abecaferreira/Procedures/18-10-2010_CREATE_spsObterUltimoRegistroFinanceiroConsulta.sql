if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterUltimoRegistroFinanceiroConsulta]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spsObterUltimoRegistroFinanceiroConsulta]
GO

CREATE PROCEDURE [dbo].[spsObterUltimoRegistroFinanceiroConsulta]
	
AS

SET NOCOUNT ON

BEGIN

		SELECT MAX(Id) FROM Financeiro WHERE TipoTransacao = 2
		 
END

SET NOCOUNT OFF
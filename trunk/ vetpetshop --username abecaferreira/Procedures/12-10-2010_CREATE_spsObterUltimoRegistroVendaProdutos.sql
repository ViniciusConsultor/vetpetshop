USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterUltimoRegistroVendaProdutos]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterUltimoRegistroVendaProdutos

GO

CREATE PROCEDURE [dbo].[spsObterUltimoRegistroVendaProdutos]
	
AS

SET NOCOUNT ON

BEGIN
		SELECT Id FROM Financeiro WHERE Id = (SELECT MAX(Id) FROM Financeiro WHERE TipoTransacao = 1)
END

SET NOCOUNT OFF

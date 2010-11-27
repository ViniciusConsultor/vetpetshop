USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsExcluirPedidosComValorNull]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsExcluirPedidosComValorNull
GO

CREATE PROCEDURE [dbo].[spsExcluirPedidosComValorNull]
	
AS

SET NOCOUNT ON

BEGIN
	DELETE FROM NotaFiscal WHERE Valor IS NULL
END

SET NOCOUNT OFF


USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListaPedidosDeCompras]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListaPedidosDeCompras
GO

CREATE PROCEDURE dbo.spsListaPedidosDeCompras
AS

SET NOCOUNT ON

BEGIN
	SELECT * FROM NotaFiscal ORDER BY DataCadastro DESC
END

SET NOCOUNT OFF


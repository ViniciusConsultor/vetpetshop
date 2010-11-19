if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsExcluirPedidosComValorNull]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsExcluirPedidosComValorNull

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsExcluirPedidosComValorNull]
	
AS
BEGIN
	delete from NotaFiscal where Valor is null
END
GO


USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spsListaPedidosDeCompras]    Script Date: 09/03/2010 01:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spsListaPedidosDeCompras] 
	
AS
BEGIN
	SELECT * FROM NotaFiscal ORDER BY DataCadastro DESC
END

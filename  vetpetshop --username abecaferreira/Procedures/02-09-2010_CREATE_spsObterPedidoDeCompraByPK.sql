USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spsObterPedidoDeCompraByPK]    Script Date: 09/02/2010 22:45:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsObterPedidoDeCompraByPK] 
	@IdNota INT
AS
BEGIN
	SELECT 
	IdUsuario,
	DataCadastro,
	Valor,
	Status
	FROM NotaFiscal WHERE Id = @IdNota
END

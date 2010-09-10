SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
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
GO

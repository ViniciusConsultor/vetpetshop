SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spuAtualizarPedidoDeCompra] 
	@IdNota INT,
	@Status INT
AS
BEGIN
	UPDATE NotaFiscal SET Status = @Status, DataRecebimento = GETDATE()
	WHERE Id = @IdNota
END
GO

USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spuAtualizarPedidoDeCompra]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spuAtualizarPedidoDeCompra
GO

CREATE PROCEDURE [dbo].[spuAtualizarPedidoDeCompra] 
	@IdNota INT,
	@Status INT
AS

SET NOCOUNT ON

BEGIN
	UPDATE NotaFiscal SET Status = @Status, DataRecebimento = GETDATE()
	WHERE Id = @IdNota
END

SET NOCOUNT OFF
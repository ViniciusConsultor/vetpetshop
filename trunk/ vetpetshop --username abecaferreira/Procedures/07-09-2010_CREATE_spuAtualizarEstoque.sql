if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spuAtualizarEstoque]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spuAtualizarEstoque
GO

CREATE PROCEDURE [dbo].[spuAtualizarEstoque] 
	@IdEstoque INT,
	@Status INT,
	@Quantidade INT
AS

SET NOCOUNT ON

BEGIN
	UPDATE Estoque SET Quantidade = @Quantidade, Status = @Status
	WHERE Id = @IdEstoque
END

SET NOCOUNT OFF
USE vetpetshop
GO
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
	
	DECLARE @Mes INT, @Ano INT	
	
	SELECT @Mes = MAX(MONTH(DataEstoque)) FROM HistoricoEstoque WHERE IdEstoque = @IdEstoque
	SELECT  @Ano = MAX(YEAR(DataEstoque)) FROM HistoricoEstoque WHERE IdEstoque = @IdEstoque
	
	IF MONTH(GETDATE()) = @Mes AND YEAR(GETDATE()) =  @Ano
	UPDATE HistoricoEstoque SET DataEstoque = GETDATE() WHERE MONTH(DataEstoque) = @Mes AND YEAR(DataEstoque) = @Ano 
	
	ELSE
	INSERT INTO HistoricoEstoque (IdEstoque, DataEstoque) VALUES (@IdEstoque, GETDATE())
END

SET NOCOUNT OFF
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spiInserirEstoque]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spiInserirEstoque
GO

CREATE PROCEDURE [dbo].[spiInserirEstoque]
	@Status INT,
	@Quantidade INT,
	@IdProd INT
AS

SET NOCOUNT ON

BEGIN
	
	INSERT INTO Estoque (Status, Quantidade) VALUES (@Status, @Quantidade)
	
	DECLARE	@IdEst INT
	SELECT @IdEst = SCOPE_IDENTITY()
	
	INSERT INTO EstoqueProduto(IdEstoque, IdProduto) VALUES (@IdEst, @IdProd) 
	
	INSERT INTO HistoricoEstoque (IdEstoque, DataEstoque) VALUES (@IdEst,GETDATE())
	
END

SET NOCOUNT OFF
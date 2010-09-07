
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spiInserirEstoque]
	@Status INT,
	@Quantidade INT,
	@IdProd INT
AS
BEGIN
	
	INSERT INTO Estoque (Status, Quantidade) VALUES (@Status, @Quantidade)
	
	DECLARE	@IdEst INT
	SELECT @IdEst = SCOPE_IDENTITY()
	
	INSERT INTO EstoqueProduto(IdEstoque, IdProduto) VALUES (@IdEst, @IdProd) 
END
GO

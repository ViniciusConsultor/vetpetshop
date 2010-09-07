
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spuAtualizarEstoque] 
	@IdEstoque INT,
	@Status INT,
	@Quantidade INT
AS
BEGIN
	UPDATE Estoque SET Quantidade = @Quantidade, Status = @Status
	WHERE Id = @IdEstoque
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spsObterEstoquePorId] 
	@IdEstoque INT	
AS
BEGIN
	SELECT * FROM Estoque WHERE Id = @IdEstoque
END
GO
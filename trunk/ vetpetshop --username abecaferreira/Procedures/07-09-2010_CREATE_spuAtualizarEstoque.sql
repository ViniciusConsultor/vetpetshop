USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spuAtualizarEstoque]    Script Date: 09/07/2010 20:32:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spuAtualizarEstoque] 
	@IdEstoque INT,
	@Status INT,
	@Quantidade INT
AS
BEGIN
	UPDATE Estoque SET Quantidade = @Quantidade, Status = @Status
	WHERE Id = @IdEstoque
END

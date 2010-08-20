SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spsObterProduto]
	@IdProduto Int
AS
BEGIN
	
	SELECT * FROM dbo.Produto WHERE Id = @IdProduto
	
END
GO

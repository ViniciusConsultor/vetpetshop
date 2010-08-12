SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spdExcluirProduto]
	
	@Id_Produto INT
AS
BEGIN
	
	DELETE FROM dbo.Produto WHERE Id = @Id_Produto
	
END
GO

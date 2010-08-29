SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spiInserirRelNotaFiscal]
	@IdNota INT,
	@IdProd INT,
	@Quantidade INT,
	@ValorNota DECIMAL(9,2)
AS
BEGIN
	UPDATE NotaFiscal SET Valor = @ValorNota WHERE Id = @IdNota
	
	INSERT INTO ProdutoNotaFiscal
	(IdProduto,IdNotaFiscal,Quantidade)
	VALUES
	(@IdProd,@IdNota,@Quantidade)
END
GO

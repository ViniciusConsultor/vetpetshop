USE [vetpetshop]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spiInserirRelNotaFiscal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spiInserirRelNotaFiscal
GO

CREATE PROCEDURE [dbo].[spiInserirRelNotaFiscal]
	@IdNota INT,
	@IdProd INT,
	@Quantidade INT,
	@ValorNota DECIMAL(9,2)
AS

SET NOCOUNT ON

BEGIN
	UPDATE NotaFiscal SET Valor = @ValorNota WHERE Id = @IdNota
	
	INSERT INTO ProdutoNotaFiscal
	(IdProduto,IdNotaFiscal,Quantidade)
	VALUES
	(@IdProd,@IdNota,@Quantidade)
END

SET NOCOUNT OFF
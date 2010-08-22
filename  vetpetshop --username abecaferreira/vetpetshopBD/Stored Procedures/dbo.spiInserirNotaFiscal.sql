SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spiInserirNotaFiscal]
	@IdUsuario INT
AS
BEGIN
	INSERT INTO dbo.NotaFiscal 
	(IdAdministrador,IdVendedor,IdUsuario,Status,DataCadastro,DataRecebimento,Valor)
	
	VALUES
	
	(NULL,NULL,@IdUsuario,1,GETDATE(),NULL,NULL)
END
GO

USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spiInserirNotaFiscal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spiInserirNotaFiscal
GO

CREATE PROCEDURE [dbo].[spiInserirNotaFiscal]
	@IdUsuario INT
AS

SET NOCOUNT ON

BEGIN
	INSERT INTO dbo.NotaFiscal 
	(IdAdministrador,IdVendedor,IdUsuario,Status,DataCadastro,DataRecebimento,Valor)
	
	VALUES
	
	(NULL,NULL,@IdUsuario,1,GETDATE(),NULL,NULL)
END

SET NOCOUNT OFF
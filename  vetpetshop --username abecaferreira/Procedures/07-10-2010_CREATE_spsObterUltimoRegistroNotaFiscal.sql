USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterUltimoRegistroNotaFiscal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterUltimoRegistroNotaFiscal
GO

CREATE PROCEDURE [dbo].[spsObterUltimoRegistroNotaFiscal]
	
AS

SET NOCOUNT ON

BEGIN

		SELECT 
		Id,
		IdUsuario,
		DataCadastro,
		Valor,
		Status,
		DataRecebimento
		FROM NotaFiscal 
		WHERE Id = (SELECT MAX(Id) FROM NotaFiscal)
		 
END

SET NOCOUNT OFF
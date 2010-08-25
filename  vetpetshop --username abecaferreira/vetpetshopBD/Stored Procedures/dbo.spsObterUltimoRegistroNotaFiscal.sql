SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spsObterUltimoRegistroNotaFiscal]
	
AS
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
GO


SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spsListaClientes] 
	
AS
BEGIN

SELECT
c.Id,
c.Nome,
c.CPF,
c.RG,
c.Telefone1,
c.Telefone2,
c.Email,
c.Endereco,
c.Bairro,
c.Cidade,
c.Estado,
c.CEP
FROM Cliente c 
ORDER BY c.Nome
	
END
GO

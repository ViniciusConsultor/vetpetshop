SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spsListaClientesByNome] 
	
@Nome VARCHAR(50)
	
AS
BEGIN

SELECT
c.Id,
c.CPF,
c.Nome,
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
Where c.Nome like '%'+@Nome+'%'
ORDER BY c.Nome
	
END

GO

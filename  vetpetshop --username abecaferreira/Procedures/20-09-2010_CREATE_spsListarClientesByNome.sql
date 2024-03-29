USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListaClientesByNome]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spsListaClientesByNome]
GO

CREATE PROCEDURE [dbo].[spsListaClientesByNome] 
	
@Nome VARCHAR(50)
	
AS

SET NOCOUNT ON

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
c.CEP,
c.Sexo
FROM Cliente c 
Where c.Nome like '%'+@Nome+'%'
ORDER BY c.Nome
	
END

SET NOCOUNT OFF

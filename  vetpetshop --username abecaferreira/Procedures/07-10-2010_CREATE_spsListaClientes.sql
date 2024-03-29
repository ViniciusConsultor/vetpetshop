USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListaClientes]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListaClientes
GO

CREATE PROCEDURE [dbo].[spsListaClientes]
	
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
c.sexo
FROM Cliente c 
ORDER BY c.Nome
	
END

SET NOCOUNT OFF
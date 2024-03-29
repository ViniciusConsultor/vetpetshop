USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListaClienteByPK]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListaClienteByPK
GO

CREATE PROCEDURE [dbo].[spsListaClienteByPK] 
	
@IdCliente int
	
AS

SET NOCOUNT ON

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
c.CEP,
c.Sexo
FROM Cliente c 
where Id = @IdCliente
	
END

SET NOCOUNT OFF
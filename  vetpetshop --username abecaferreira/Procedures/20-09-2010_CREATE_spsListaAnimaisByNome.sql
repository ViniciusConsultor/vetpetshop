USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListaAnimaisByNome]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListaAnimaisByNome
GO

CREATE PROCEDURE [dbo].[spsListaAnimaisByNome] 
	
@Nome VARCHAR(50)
	
AS

SET NOCOUNT ON

BEGIN

SELECT
a.Id,
a.Nome,
a.Peso,
a.Raca,
a.DataNascimento,
a.DataProxVacinacao,
a.DataFimVacinacao,
a.IdTipoAnimal,
a.IdCliente,
a.Sexo
FROM Animal a
WHERE a.Nome like '%'+@Nome+'%'
ORDER BY a.Nome
	
END

SET NOCOUNT OFF
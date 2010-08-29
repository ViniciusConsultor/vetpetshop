SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spsListaAnimaisByNome] 
	
@Nome VARCHAR(50)
	
AS
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
a.IdCliente
FROM Animal a
WHERE a.Nome like '%'+@Nome+'%'
ORDER BY a.Nome
	
END

GO

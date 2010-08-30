SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spsListaAnimalByPK] 
	
@IdAnimal int
	
AS
BEGIN

SELECT
a.Id,
a.Nome,
a.Peso,
a.Raca,
a.DataNascimento,
a.IdTipoAnimal
FROM Animal a 
where Id = @IdAnimal
	
END
GO

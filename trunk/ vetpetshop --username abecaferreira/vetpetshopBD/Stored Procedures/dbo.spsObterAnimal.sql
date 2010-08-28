
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spsObterAnimal]
	@IdAnimal Int
AS
BEGIN
	
	SELECT	a.Id,
			a.Nome,
			a.Peso,
			a.Raca,
			a.DataNascimento,
			a.DataProxVacinacao
	
	 FROM dbo.Animal a WHERE Id = @IdAnimal
	
END
GO

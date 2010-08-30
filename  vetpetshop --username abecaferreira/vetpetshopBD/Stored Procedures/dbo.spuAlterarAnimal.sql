SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spuAlterarAnimal]

@IdAnimal int,
@Nome_Animal VARCHAR(50),
@Peso decimal(9,2),
@Raca VARCHAR(20),
@Nascimento datetime,
@TipoAnimal int

AS
BEGIN
	UPDATE dbo.Animal SET 
	Nome = @Nome_Animal,
	Peso = @Peso,
	@Raca = @Raca,
	DataNascimento = @Nascimento,
	IdTipoAnimal = @TipoAnimal
	WHERE Id = @IdAnimal
END


GO

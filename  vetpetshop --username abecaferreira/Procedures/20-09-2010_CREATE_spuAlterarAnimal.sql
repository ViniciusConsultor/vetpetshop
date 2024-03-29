USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spuAlterarAnimal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spuAlterarAnimal
GO

CREATE PROCEDURE [dbo].[spuAlterarAnimal]

@IdAnimal int,
@Nome_Animal VARCHAR(50),
@Peso decimal(9,2),
@Raca VARCHAR(50),
@Nascimento datetime,
@TipoAnimal int,
@Sexo varchar(10)

AS

SET NOCOUNT ON

BEGIN
	UPDATE dbo.Animal SET 
	Nome = @Nome_Animal,
	Peso = @Peso,
	Raca = @Raca,
	DataNascimento = @Nascimento,
	IdTipoAnimal = @TipoAnimal,
	Sexo = @Sexo
	WHERE Id = @IdAnimal
END

SET NOCOUNT OFF

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spiInserirConsultaVeterinaria]
 
@IdUsuario		int,
@IdAnimal		int,
@Valor			decimal,
@Data			datetime,
@Status			int
 
AS

DECLARE @IdConsulta		int

BEGIN TRANSACTION

	INSERT INTO dbo.ConsultaVeterinaria
	( 
				IdUsuario,	
				Valor,		
				Data,		
				[Status]
	)
	VALUES
	( 
				@IdUsuario,	
				@Valor,		
				@Data,		
				@Status
	)
			
	SET @IdConsulta = @@IDENTITY

	IF @@ERROR <> 0 
	BEGIN
		ROLLBACK TRANSACTION
		RETURN
	END

	INSERT INTO dbo.ConsultaAnimal
	( 
				IdConsulta,	
				IdAnimal
	)
	VALUES
	( 
				@IdConsulta,	
				@IdAnimal
	)
			


	IF @@ERROR <> 0 
	BEGIN
		ROLLBACK TRANSACTION
		RETURN
	END


	--SELECT @IdConsulta

COMMIT TRANSACTION
GO

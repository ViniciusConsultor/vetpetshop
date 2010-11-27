USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spiInserirConsultaVeterinaria]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spiInserirConsultaVeterinaria]

GO

CREATE PROCEDURE [dbo].[spiInserirConsultaVeterinaria]
 
@IdUsuario		int,
@IdAnimal		int,
@Valor			decimal(9,2),
@Data			datetime,
@Status			int,
@Tipo			int,
@DataVacinacao	datetime,
@Hora			VARCHAR(30)
 
AS

DECLARE @IdConsulta		int

BEGIN TRANSACTION

	IF @Tipo = 1
	INSERT INTO dbo.ConsultaVeterinaria
	( 
				IdUsuario,	
				Valor,		
				Data,		
				[Status],
				TipoConsulta,
				HoraConsulta
	)
	VALUES
	( 
				@IdUsuario,	
				@Valor,		
				@Data,		
				@Status,
				@Tipo,
				@Hora
	)
	
	ELSE
		INSERT INTO dbo.ConsultaVeterinaria
	( 
				IdUsuario,	
				Valor,		
				Data,		
				[Status],
				TipoConsulta,
				HoraConsulta
	)
	VALUES
	( 
				@IdUsuario,	
				@Valor,		
				@DataVacinacao,		
				@Status,
				@Tipo,
				@Hora
	)
	
			
	SET @IdConsulta = @@IDENTITY
	
	IF @Tipo = 2
	BEGIN
	UPDATE dbo.Animal SET 
	DataProxVacinacao = @DataVacinacao
	WHERE Id = @IdAnimal	
	END

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
USE [vetpetshop]
GO
/****** Object:  StoredProcedure [dbo].[spiInserirConsultaVeterinaria]    Script Date: 10/18/2010 22:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spiInserirConsultaVeterinaria]
 
@IdUsuario		int,
@IdAnimal		int,
@Valor			decimal(9,2),
@Data			datetime,
@Status			int,
@Tipo			int,
@DataVacinacao	datetime
 
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
				TipoConsulta
	)
	VALUES
	( 
				@IdUsuario,	
				@Valor,		
				@Data,		
				@Status,
				@Tipo
	)
	
	ELSE
		INSERT INTO dbo.ConsultaVeterinaria
	( 
				IdUsuario,	
				Valor,		
				Data,		
				[Status],
				TipoConsulta
	)
	VALUES
	( 
				@IdUsuario,	
				@Valor,		
				@DataVacinacao,		
				@Status,
				@Tipo
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
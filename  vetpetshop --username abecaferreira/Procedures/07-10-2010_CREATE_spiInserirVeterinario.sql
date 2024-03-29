USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spiInserirVeterinario]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spiInserirVeterinario
GO

CREATE PROCEDURE [dbo].[spiInserirVeterinario] 
@Nome_Prof VARCHAR(50),
@Nome_Usuario VARCHAR(20),
@Tipo INT,
@Senha VARCHAR(50),
@Email VARCHAR(50)
	
AS

SET NOCOUNT ON

BEGIN
	INSERT INTO dbo.Veterinario (Nome) VALUES (@Nome_Prof)
	
	DECLARE @idVet INT
	SELECT @idVet = SCOPE_IDENTITY()

	INSERT INTO dbo.Usuario 
	(IdAdministrador, 
	IdVeterinario,
	IdVendedor,
	Nome,
	TipoUsuario,
	Senha,
	Email)	
	VALUES
	(NULL,
	@idVet,
	NULL,
	@Nome_Usuario,
	@Tipo,
	@Senha,
	@Email)
END

SET NOCOUNT OFF
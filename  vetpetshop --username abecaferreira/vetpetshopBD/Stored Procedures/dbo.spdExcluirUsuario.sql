SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spdExcluirUsuario]

	@Id int
	
AS
BEGIN

	DECLARE 
	@idAdmin int,
	@idVet int,
	@idVend int	
	
	SET @idAdmin = (SELECT IdAdministrador FROM Usuario WHERE Id = @Id)
	SET @idVet = (SELECT IdVeterinario FROM Usuario WHERE Id = @Id)
	SET @idVend = (SELECT IdVendedor FROM Usuario WHERE Id = @Id)
	
	DELETE FROM Usuario WHERE Id = @Id
	
	IF(@idAdmin IS NOT NULL)
	BEGIN 
	DELETE FROM dbo.Administrador WHERE Id = @idAdmin
	END
	
	IF(@idVet IS NOT NULL)
	BEGIN 
	DELETE FROM dbo.Veterinario WHERE Id = @idVet
	END
	
	IF(@idVend IS NOT NULL)
	BEGIN 
	DELETE FROM dbo.Vendedor WHERE Id = @idVend
	END
END
GO

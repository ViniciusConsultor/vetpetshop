USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spiInserirVendedor]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spiInserirVendedor
GO

CREATE PROCEDURE [dbo].[spiInserirVendedor]
@Nome_Prof VARCHAR(50),
@Nome_Usuario VARCHAR(20),
@Tipo INT,
@Senha VARCHAR(50),
@Email VARCHAR(50)

AS

SET NOCOUNT ON

BEGIN
	INSERT INTO dbo.Vendedor(Nome) VALUES (@Nome_Prof)
	
	DECLARE @idVend INT
	SELECT @idVend = SCOPE_IDENTITY()

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
	NULL,
	@idVend,
	@Nome_Usuario,
	@Tipo,
	@Senha,
	@Email)
END

SET NOCOUNT OFF
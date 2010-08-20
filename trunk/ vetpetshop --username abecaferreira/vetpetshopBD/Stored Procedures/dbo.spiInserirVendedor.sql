SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spiInserirVendedor]
@Nome_Prof VARCHAR(50),
@Nome_Usuario VARCHAR(20),
@Tipo INT,
@Senha VARCHAR(50)

AS
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
	Senha)	
	VALUES
	(NULL,
	NULL,
	@idVend,
	@Nome_Usuario,
	@Tipo,
	@Senha)
END
GO

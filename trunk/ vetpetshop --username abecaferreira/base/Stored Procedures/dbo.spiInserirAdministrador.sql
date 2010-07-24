SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spiInserirAdministrador]

@Nome_Pessoa VARCHAR(50),
@Nome VARCHAR(20),
@Tipo INT,
@Senha VARCHAR(50)

AS
BEGIN

INSERT INTO dbo.Administrador (Nome) VALUES (@Nome_Pessoa)

DECLARE @idAmin INT

SELECT @idAmin = SCOPE_IDENTITY()

	INSERT INTO dbo.Usuario 
	(IdAdministrador, 
	IdVeterinario,
	IdVendedor,
	Nome,
	TipoUsuario,
	Senha)	
	VALUES
	(@idAmin,
	NULL,
	NULL,
	@Nome,
	@Tipo,
	@Senha)
END
GO

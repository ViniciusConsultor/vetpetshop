SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spsLogin]
	@Usuario VARCHAR(15),
	@Senha VARCHAR(30)
AS
BEGIN
SELECT 
TipoUsuario,
Nome,
Senha 
FROM Usuario WHERE Nome = @Usuario AND Senha = @Senha
END
GO

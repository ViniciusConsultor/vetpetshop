SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spsObterUsuarioPorCodigoUsuario] 
	@Nome_Usuario VARCHAR(30)
AS
BEGIN
	SELECT * FROM Usuario WHERE Nome = @Nome_Usuario
END
GO

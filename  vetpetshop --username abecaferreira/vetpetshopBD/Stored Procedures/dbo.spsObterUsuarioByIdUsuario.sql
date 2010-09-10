SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spsObterUsuarioByIdUsuario] 
	@IdUsuario INT
AS
BEGIN
	SELECT * FROM Usuario WHERE Id = @IdUsuario
END
GO

USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterUsuarioPorCodigoUsuario]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterUsuarioPorCodigoUsuario
GO

CREATE PROCEDURE [dbo].[spsObterUsuarioPorCodigoUsuario] 
	@Nome_Usuario VARCHAR(30)
AS

SET NOCOUNT ON

BEGIN
	SELECT * FROM Usuario WHERE Nome = @Nome_Usuario
END

SET NOCOUNT OFF
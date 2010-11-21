if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterUsuarioByEmailUsuario]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterUsuarioByEmailUsuario
GO

CREATE PROCEDURE [dbo].[spsObterUsuarioByEmailUsuario] 
	@Email VARCHAR(30)
AS

SET NOCOUNT ON

BEGIN
	SELECT * FROM Usuario WHERE Email = @Email
END

SET NOCOUNT OFF
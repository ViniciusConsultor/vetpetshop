USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterUsuarioByIdUsuario]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterUsuarioByIdUsuario
GO

CREATE PROCEDURE [dbo].[spsObterUsuarioByIdUsuario] 
	@IdUsuario INT
AS

SET NOCOUNT ON

BEGIN
	SELECT * FROM Usuario WHERE Id = @IdUsuario
END

SET NOCOUNT OFF
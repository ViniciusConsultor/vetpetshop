USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterConsultaPorUsuario]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterConsultaPorUsuario
GO

CREATE PROCEDURE [dbo].[spsObterConsultaPorUsuario]
	@Id_Usuario INT
AS

SET NOCOUNT ON

BEGIN
	SELECT COUNT(*) FROM ConsultaVeterinaria WHERE IdUsuario = @Id_Usuario
END

SET NOCOUNT OFF

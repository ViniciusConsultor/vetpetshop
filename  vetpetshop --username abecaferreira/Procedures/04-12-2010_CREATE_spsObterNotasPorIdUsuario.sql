USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterNotasPorIdUsuario]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterNotasPorIdUsuario
GO

CREATE PROCEDURE [dbo].[spsObterNotasPorIdUsuario] 
	@Id_Usuario INT
AS

SET NOCOUNT ON

BEGIN
	SELECT COUNT(*) FROM NotaFiscal WHERE IdUsuario=@Id_Usuario
END

SET NOCOUNT OFF
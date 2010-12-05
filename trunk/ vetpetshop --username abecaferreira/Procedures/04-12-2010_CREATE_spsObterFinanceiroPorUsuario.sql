USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsObterFinanceiroPorUsuario]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsObterFinanceiroPorUsuario
GO

CREATE PROCEDURE [dbo].[spsObterFinanceiroPorUsuario]
	@Id_Usuario INT
AS

SET NOCOUNT ON

BEGIN
	SELECT COUNT(*) FROM Financeiro WHERE IdUsuario = @Id_Usuario
END

SET NOCOUNT OFF
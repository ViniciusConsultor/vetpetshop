USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsListaGruposProdutos]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsListaGruposProdutos
GO

CREATE PROCEDURE [dbo].[spsListaGruposProdutos] 
	
AS

SET NOCOUNT ON

BEGIN
	SELECT Id, Nome FROM Grupo
END

SET NOCOUNT OFF
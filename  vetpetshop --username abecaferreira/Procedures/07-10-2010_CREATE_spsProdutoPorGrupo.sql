USE vetpetshop
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spsProdutoPorGrupo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].spsProdutoPorGrupo
GO

CREATE PROCEDURE [dbo].[spsProdutoPorGrupo]
	@Id_Grupo int
AS

SET NOCOUNT ON

BEGIN
	SELECT * FROM dbo.Produto WHERE IdGrupo = @Id_Grupo
END

SET NOCOUNT OFF
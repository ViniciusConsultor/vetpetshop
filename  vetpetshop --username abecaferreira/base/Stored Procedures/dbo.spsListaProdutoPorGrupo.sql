SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spsListaProdutoPorGrupo]
	@Id_Grupo int
AS
BEGIN
	SELECT * FROM dbo.Produto WHERE IdGrupo = @Id_Grupo
END
GO

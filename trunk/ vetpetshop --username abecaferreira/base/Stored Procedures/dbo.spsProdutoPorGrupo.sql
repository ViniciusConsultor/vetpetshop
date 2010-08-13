SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[spsProdutoPorGrupo]
	@Id_Grupo int
AS
BEGIN
	SELECT * FROM dbo.Produto WHERE IdGrupo = @Id_Grupo
END
GO
